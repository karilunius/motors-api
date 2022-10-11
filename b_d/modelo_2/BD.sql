-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vehiculos
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema location_model
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema location_model
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `location_model` DEFAULT CHARACTER SET utf8mb4 ;
USE `location_model` ;

-- -----------------------------------------------------
-- Table `location_model`.`continentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`continentes` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(12) NOT NULL,
  `descripcion` VARCHAR(35) NOT NULL,
  `estado` BIT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `location_model`.`paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`paises` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(12) NOT NULL,
  `descripcion` VARCHAR(35) NOT NULL,
  `estado` BIT NULL DEFAULT 1,
  `id_continente` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `FKeskjwgmjcc5h5n1eh62de0phm`
    FOREIGN KEY (`id_continente`)
    REFERENCES `location_model`.`continentes` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `location_model`.`departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`departamentos` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(12) NOT NULL,
  `descripcion` VARCHAR(35) NOT NULL,
  `estado` BIT NULL DEFAULT 1,
  `paises_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_departamentos_paises1`
    FOREIGN KEY (`paises_id`)
    REFERENCES `location_model`.`paises` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `location_model`.`municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`municipios` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(12) NOT NULL,
  `descripcion` VARCHAR(35) NOT NULL,
  `estado` BIT NULL DEFAULT 1,
  `departamentos_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_municipios_departamentos1`
    FOREIGN KEY (`departamentos_id`)
    REFERENCES `location_model`.`departamentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `location_model`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`persona` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(40) NOT NULL,
  `correo` VARCHAR(40) NOT NULL,
  `documento` VARCHAR(12) NOT NULL,
  `nombre` VARCHAR(40) NOT NULL,
  `telefono` VARCHAR(40) NOT NULL,
  `estado` BIT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `location_model`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`roles` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(12) NOT NULL,
  `descripcion` VARCHAR(35) NOT NULL,
  `estado` BIT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `location_model`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`usuario` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `contrasenia` VARCHAR(100) NOT NULL,
  `usuario` VARCHAR(30) NOT NULL,
  `estado` BIT NULL DEFAULT 1,
  `persona_id` BIGINT(20) NOT NULL,
  `roles_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_usuario_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `location_model`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES `location_model`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `location_model`.`marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`marcas` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(12) NOT NULL,
  `descripcion` VARCHAR(35) NOT NULL,
  `estado` BIT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `location_model`.`tipos_vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`tipos_vehiculos` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(12) NOT NULL,
  `descripcion` VARCHAR(35) NOT NULL,
  `estado` BIT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `location_model`.`vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`vehiculos` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(12) NOT NULL,
  `descripcion` VARCHAR(35) NOT NULL,
  `color` VARCHAR(45) NULL,
  `cilindraje` VARCHAR(45) NULL,
  `kilometraje` INT NULL,
  `estado` BIT NULL DEFAULT 1,
  `marcas_id` BIGINT(20) NOT NULL,
  `tipos_vehiculos_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_vehiculos_marcas1`
    FOREIGN KEY (`marcas_id`)
    REFERENCES `location_model`.`marcas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculos_tipos_vehiculos1`
    FOREIGN KEY (`tipos_vehiculos_id`)
    REFERENCES `location_model`.`tipos_vehiculos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COMMENT = '		';


-- -----------------------------------------------------
-- Table `location_model`.`inventarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`inventarios` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `precio_unitario` DOUBLE NOT NULL,
  `cantidad_existente` INT NOT NULL,
  `observacion` VARCHAR(300) NULL,
  `estado` BIT NULL DEFAULT 1,
  `vehiculos_id` BIGINT(20) NOT NULL,
  `tipo_estado` ENUM('Nuevo', 'Usado') NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_inventarios_vehiculos1`
    FOREIGN KEY (`vehiculos_id`)
    REFERENCES `location_model`.`vehiculos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `location_model`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`facturas` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(12) NOT NULL,
  `valor_total` INT NOT NULL,
  `fecha` DATE NULL,
  `estado` BIT NULL,
  `municipios_id` BIGINT(20) NOT NULL,
  `persona_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_facturas_municipios1`
    FOREIGN KEY (`municipios_id`)
    REFERENCES `location_model`.`municipios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `location_model`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `location_model`.`detalles_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `location_model`.`detalles_facturas` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `cantidad` VARCHAR(35) NOT NULL,
  `precio` INT NULL,
  `estado` BIT NULL,
  `facturas_id` BIGINT(20) NOT NULL,
  `inventarios_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_detalles_facturas_facturas1`
    FOREIGN KEY (`facturas_id`)
    REFERENCES `location_model`.`facturas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalles_facturas_inventarios1`
    FOREIGN KEY (`inventarios_id`)
    REFERENCES `location_model`.`inventarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
