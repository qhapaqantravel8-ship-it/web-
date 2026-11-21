@echo off
title Curamba Travel - sitio local
cd /d "%~dp0wp-prueba"
echo.
echo  Curamba Travel - sitio local
echo  ----------------------------
echo  En esta PC:   http://127.0.0.1:8080/
echo  Panel:        http://127.0.0.1:8080/wp-admin/
echo.
echo  En tu telefono (conectado al mismo Wi-Fi):
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
  for /f "tokens=*" %%b in ("%%a") do echo                http://%%b:8080/
)
echo.
echo  Deja esta ventana abierta mientras uses el sitio.
echo  Para apagarlo, cierra esta ventana.
echo.
start "" cmd /c "timeout /t 2 /nobreak >nul & start http://127.0.0.1:8080/wp-admin/"
php\php.exe -d error_reporting=24575 -S 0.0.0.0:8080 -t site
pause
