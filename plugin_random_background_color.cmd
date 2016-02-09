
::~~Script~~.

@echo off
@cls

::-----------------------------------------------------------------------------
::  plugin_text_2.CMD                                                09/02/2016
::-----------------------------------------------------------------------------
::  Description  :  Sets or clears a group of environment variables containing
::               :  
::               :  
::               :
::  Requires     :  Windows NT with command extensions enabled
::               :
::  Tested       :  Yes, as demonstration
::               :
::  Contact      :  Paco Tudel <paco(dot)tudel(at)gmail(dot)com>
::               :  Systems Engineer and IT fighter
::-----------------------------------------------------------------------------
::  USAGE
::
::  
::-----------------------------------------------------------------------------
::  NOTES
::
::  
::-----------------------------------------------------------------------------

@setlocal EnableDelayedExpansion

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
@set IMMG_CM=-size 1366x768 xc:"rgb(%RR%,%GG%,%BB%)"

:: Generate image
:: IMMG_CM Commands to pass to convert.exe that makes the big colored image
@%CONVERT% %IMMG_CM% %DEST_IMAGE%

:: Set image as wallpaper on windows
@%WPCHANGER% %DEST_IMAGE% 2
::--------------------------------------------------------------------------