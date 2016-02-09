::~~Script~~.

@echo off
@cls

::-----------------------------------------------------------------------------
::  plugin_text_with_nice_square_1.cmd                               09/02/2016
::-----------------------------------------------------------------------------
::  Description  :  Put some text (2 lines of text) in a zone of desktop 
::               :  with fixed background color and at the background 
::               :  a gray square
::               :
::  Requires     :  Windows NT with command extensions enabled
::               :
::  Tested       :  Yes, as demonstration
::               :
::  Contact      :  Paco Tudel <paco(dot)tudel(at)gmail(dot)com>
::               :  Systems Engineer and IT fighter
::-----------------------------------------------------------------------------
::  USAGE        :  Simply download the tools and put in the bin directory
::               :  of yout computer and execute the script :)
::  
::-----------------------------------------------------------------------------
::  NOTES
::
::  
::-----------------------------------------------------------------------------


@setlocal EnableDelayedExpansion

:: Location of text on the screen
@set TODO_X=997
@set TODO_Y=100

:: Set programs that does the job
:: Convert from imagemagick makes the image
@SET "CONVERT=..\bin\imagemagick\convert.exe"
:: Wallpaperchanger changes on windows the image of my desktop
@SET "WPCHANGER=..\bin\wallpaperchanger\wallpaperchanger.exe"
:: Folder where the script is executed
@SET MYPATH=%~dp0
@set DEST_IMAGE=%MYPATH%temp\FONDO.bmp
:: Colors from http://cloford.com/resources/colours/500col.htm
:: COLOR violetred 1 -> 255 62 150
:: COLOR skyblue 1   -> 135	206	255
@set BACKGROUND_RGB_COLOR=135,206,255
:: Size and color of the image
@set IMMG_CM=-size 1366x768 xc:"rgb(%BACKGROUND_RGB_COLOR%)"

:: Rounded rectangle
@set "RECT_COLOR=gray"
@set /A RECT_X=%TODO_X%-10
@set /A RECT_Y=%TODO_Y%-10
@set /A RECT_X2=%RECT_X%+200
@set /A RECT_Y2=%RECT_Y%+530
@set RECT=-fill %RECT_COLOR% -draw "roundrectangle %RECT_X%,%RECT_Y%,%RECT_X2%,%RECT_Y2%,2,2"

@rem PLUGIN TEXT
@set "TEXT_FONT=-font Courier-new-Bold -pointsize 20"
@set "TEXT_TEXT=Computer: %COMPUTERNAME%"
@set "TEXT_COLOR=red"
@set /A TEXT_X=%TODO_X%+2
@set /A TEXT_Y=%TODO_Y%+2
@set TEXT=%TEXT% -fill black %TEXT_FONT% -annotate +%TEXT_X%+%TEXT_Y% "%TEXT_TEXT%" 
@set "TEXT_TEXT=User    : %USERNAME%"
@set "TEXT_COLOR=red"
@set /A TEXT_X=%TODO_X%+2
@set /A TEXT_Y=%TODO_Y%+20
@set TEXT=%TEXT% -fill black %TEXT_FONT% -annotate +%TEXT_X%+%TEXT_Y% "%TEXT_TEXT%" 

:: Generate image
:: IMMG_CM Commands to pass to convert.exe that makes the big colored image
:: For debug purposes i put a echo first
@echo %CONVERT% %IMMG_CM% %RECT% %TEXT% %DEST_IMAGE%
@%CONVERT% %IMMG_CM% %RECT% %TEXT% %DEST_IMAGE%

:: Set image as wallpaper on windows
@%WPCHANGER% %DEST_IMAGE% 2

:: ------CLEAN
@del %MYPATH%\TEMP\*.* /Q
::--------------------------------------------------------------------------