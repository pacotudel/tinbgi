@setlocal EnableDelayedExpansion
@echo Off
@cls
:: Set programs that does the job
:: Convert from imagemagick makes the image
@SET "CONVERT=..\bin\imagemagick\convert.exe"
:: Wallpaperchanger changes on windows the image of my desktop
@SET "WPCHANGER=..\bin\wallpaperchanger\wallpaperchanger.exe"
:: Folder where the script is executed
@SET MYPATH=%~dp0


@set DEST_IMAGE=%MYPATH%images\FONDO.bmp
:: The random colors
:: Red
@set /a RR=%RANDOM% * 254 / 32768 + 1
:: Green
@set /a GG=%RANDOM% * 254 / 32768 + 1
:: Blue
@set /a BB=%RANDOM% * 254 / 32768 + 1
:: the -size parameter is the size of your screen
@set ORIG_IMAGE=-size 1366x768 xc:"rgb(%RR%,%GG%,%BB%)"


@%CONVERT% %ORIG_IMAGE% %DEST_IMAGE%


:: -----------SET WALLPAPER
@%WPCHANGER% %DEST_IMAGE% 2
::---------------------------------------------------------------------------------------------------------------------------------------