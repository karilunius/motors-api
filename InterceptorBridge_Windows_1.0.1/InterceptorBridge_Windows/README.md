# Postman <> Interceptor Bridge

## Installation Guide

- Double click on `install_host.bat` to install the Native Messaging host for Interceptor <> Postman App Integration. 

- This script installs the native messaging host for the current user by creating a registry key at `HKCU\Software\Google\Chrome\NativeMessagingHosts\com.postman.postmanapp` and setting its default path the full path to `com.postman.postmanapp.json`. Learn [more](https://developers.chrome.com/apps/nativeMessaging).

- Once installed, you'll need to restart Chrome for the changes to take effect
