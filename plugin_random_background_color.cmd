::xc:"rgb(XX,YY,ZZ)"
@setlocal EnableDelayedExpansion
@echo Off
@cls
@SET MYPATH=%~dp0
@set FONDO_ORIGINAL=%MYPATH%images\desert.jpg
@set FONDO_DESTINO=%MYPATH%images\!USERNAME!_!USERDOMAIN!_FONDO.bmp
@set /a RR=%RANDOM% * 254 / 32768 + 1
@set /a GG=%RANDOM% * 254 / 32768 + 1
@set /a BB=%RANDOM% * 254 / 32768 + 1
@set FONDO_ORIGINAL=-size 1366x768 xc:"rgb(%RR%,%GG%,%BB%)"
@set TODO_X=580
@set TODO_Y=160
@set "LINEA=------------------------------------"
@set BARRA=

@echo %BARRA%
@.\bin\convert %FONDO_ORIGINAL% %BARRA% %FONDO_DESTINO%
@rem "C:\Program Files (x86)\IrfanView\i_view32.exe" %FONDO_DESTINO%

:: -----------SET WALLPAPER
::@"C:\Program Files (x86)\IrfanView\i_view32.exe" %FONDO_DESTINO% /wall=2
@bin\wallpaperchanger %FONDO_DESTINO% 2

:: ------CLEAN
@del %MYPATH%\TEMP\*.* /Q
::---------------------------------------------------------------------------------------------------------------------------------------