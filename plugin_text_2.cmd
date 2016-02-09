::~~Author~~.          Brett Middleton
::~~Email_Address~~. brettm@arches.uga.edu
::~~Script_Type~~.   nt command line batch
::~~Sub_Type~~. Misc
::~~Keywords~~. environment variables

::~~Comment~~.
::

::~~Script~~.

@echo off
@cls

::-----------------------------------------------------------------------------
::  plugin_text_2.CMD                                                09/02/2016
::-----------------------------------------------------------------------------
::  Description  :  Put some text (2 lines of text) in a zone of desktop 
::               :  with fixed background color
::               :  
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
@set DEST_IMAGE=%MYPATH%images\FONDO.bmp
:: Colors from http://cloford.com/resources/colours/500col.htm
:: COLOR violetred 1 -> 255 62 150
:: COLOR skyblue 1   -> 135	206	255
@set BACKGROUND_RGB_COLOR=135,206,255
:: Size and color of the image
@set IMMG_CM=-size 1366x768 xc:"rgb(%BACKGROUND_RGB_COLOR%)"

@rem PLUGIN TITULO
@set "TITULO_FONT=-font Courier-new-Bold -pointsize 20"
@set "TITULO_TEXT=Computer: %COMPUTERNAME%"
@set "TITULO_COLOR=red"
@set /A TITULO_X=%TODO_X%+2
@set /A TITULO_Y=%TODO_Y%+2
@set TITULO=-fill black %TITULO_FONT% -annotate +%TITULO_X%+%TITULO_Y% "%TITULO_TEXT%" 
@set "TITULO_TEXT=User    : %USERNAME%"
@set "TITULO_COLOR=red"
@set /A TITULO_X=%TODO_X%+2
@set /A TITULO_Y=%TODO_Y%+20
@set TITULO=%TITULO% -fill black %TITULO_FONT% -annotate +%TITULO_X%+%TITULO_Y% "%TITULO_TEXT%" 

:: Generate image
:: IMMG_CM Commands to pass to convert.exe that makes the big colored image
:: For debug purposes i put a echo first
::@echo %CONVERT% %IMMG_CM% %TITULO% %DEST_IMAGE%
@%CONVERT% %IMMG_CM% %TITULO% %DEST_IMAGE%

:: Set image as wallpaper on windows
@%WPCHANGER% %DEST_IMAGE% 2
::--------------------------------------------------------------------------