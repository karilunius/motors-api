:: Deletes the registry key entry created by install_host.bat
REG DELETE "HKCU\Software\Google\Chrome\NativeMessagingHosts\com.postman.postmanapp" /f

:: Deletes the .postman and its subfolders
rmdir /Q /s "%USERPROFILE%\.postman"