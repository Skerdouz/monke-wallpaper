@echo off
setlocal

set "image_url=https://pixeldrain.com/api/file/A3EMs6TR"
set "image_path=%USERPROFILE%\Downloads\yougotmonke.png"

if exist "%image_path%" (
  del "%image_path%"
  echo Image already existing, deleting...
)

curl -o "%image_path%" "%image_url%"

if exist "%image_path%" (
  echo New monke downloaded !
  reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%image_path%" /f
  RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True
echo Monke succesfuly installed in da computer !
) else (
  echo Oh no, monke failed to install itself...
)

endlocal
pause
