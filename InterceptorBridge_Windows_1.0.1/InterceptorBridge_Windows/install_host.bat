
mkdir "%USERPROFILE%\.postman\InterceptorBridge"

@Echo off
SETLOCAL ENABLEDELAYEDEXPANSION

for /f "tokens=*delims=" %%a in (com.postman.postmanapp.json) do (

set str=%%a
set str=!str:HOST_PATH=%USERPROFILE%\.postman\InterceptorBridge/InterceptorBridge.exe!
set str=!str:\=\\!
echo !str!>>temp.json
)

move /y temp.json com.postman.postmanapp.json

ENDLOCAL 


copy "%~dp0InterceptorBridge.exe" "%USERPROFILE%\.postman\InterceptorBridge"
copy "%~dp0com.postman.postmanapp.json" "%USERPROFILE%\.postman\InterceptorBridge"

REG ADD "HKCU\Software\Google\Chrome\NativeMessagingHosts\com.postman.postmanapp" /ve /t REG_SZ /d "%USERPROFILE%\.postman\InterceptorBridge\com.postman.postmanapp.json" /f
