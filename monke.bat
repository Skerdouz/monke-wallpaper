@echo off
setlocal

set "image_url=https://media.discordapp.net/attachments/1255586330436440085/1255586347406856323/l2GmMgt0YvB1Er.png?ex=667dab68&is=667c59e8&hm=84871aab55d00ae8c95ec2e2033a90c5bae627b59c00dae71256e7b6a8440da8&=&format=webp&quality=lossless&width=710&height=754"
set "image_path=%USERPROFILE%\Downloads\yougotmonke.jpg"

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
