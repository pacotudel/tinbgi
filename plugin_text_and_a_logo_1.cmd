::~~Script~~.

@echo off
@cls

::-----------------------------------------------------------------------------
::  plugin_text_and_a_logo_1.cmd.cmd                                 10/02/2016
::-----------------------------------------------------------------------------
::  Description  :  Same but adding a logo image at top left. 
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
::  USAGE        :  Simply download the tools and put in the bin directory
::               :  of yout computer and execute the script :)
::  
::-----------------------------------------------------------------------------
::  NOTES
::
::  
::-----------------------------------------------------------------------------


@setlocal EnableDelayedExpansion

:: Screen Resolution
@set SCREEN_RES=1920x1080

:: Reference location of all data (text ... rectangles... logo...) on the image
@set TODO_X=1550
@set TODO_Y=170

:: Set programs that does the job
:: Convert from imagemagick makes the image
@SET "CONVERT=..\bin\imagemagick\convert.exe"
:: Wallpaperchanger changes on windows the image of my desktop
@SET "WPCHANGER=..\bin\wallpaperchanger\wallpaperchanger.exe"
:: Folder where the script is executed
@SET MYPATH=%~dp0
@set DEST_IMAGE=%MYPATH%img_temp\FONDO.bmp
:: Colors from http://cloford.com/resources/colours/500col.htm
:: COLOR violetred 1 -> 255 62 150
:: COLOR skyblue 1   -> 135	206	255
@set BACKGROUND_RGB_COLOR=135,206,255
:: Size and color of the image
@set IMMG_CM=-size %SCREEN_RES% xc:"rgb(%BACKGROUND_RGB_COLOR%)"

:: Put a nice logo on right corner
:: Size of my logo is x=242 y=243
@set LOGO_FILE=images\logo.png
@set /A LOGO_X0=TODO_X + 100
@set /A LOGO_Y0=TODO_Y - 165
@set /A LOGO_X1=121
@set /A LOGO_Y1=121
@set TEXT=%TEXT% -draw "image SrcOver %LOGO_X0%,%LOGO_Y0% %LOGO_X1%,%LOGO_Y1% '%LOGO_FILE%'"

:: Rounded rectangle
@set "RECT_COLOR=darkgray"
@set "RECT_COLOR_BRD=gray"
@set /A RECT_X=%TODO_X%-5
@set /A RECT_Y=%TODO_Y%-15
@set /A RECT_X2=%RECT_X%+350
@set /A RECT_Y2=%RECT_Y%+72
@set RECT=-fill %RECT_COLOR% -stroke !RECT_COLOR_BRD! -strokewidth 2 -draw "roundrectangle %RECT_X%,%RECT_Y%,%RECT_X2%,%RECT_Y2%,2,2"


@rem PLUGIN TITLE
@set "TITLE_FONT=-font Courier-new-Bold -pointsize 20"
@set "TITLE_TEXT=Acme Computing"
@set "TITLE_COLOR=red"
@set /A TITLE_X=%TODO_X%+1
@set /A TITLE_Y=%TODO_Y%-25
@set /A TITLE_X_2=%TITLE_X%+2
@set /A TITLE_Y_2=%TITLE_Y%+2
@set TITLE=-fill black %TITLE_FONT% -annotate +%TITLE_X_2%+%TITLE_Y_2% "%TITLE_TEXT%" -fill %TITLE_COLOR% %TITLE_FONT% -annotate +%TITLE_X%+%TITLE_Y% "%TITLE_TEXT%"

@rem PLUGIN TEXT
@set "TEXT_FONT=-font Courier-new -pointsize 13 -kerning 0.2 -strokewidth 0.002"
@set "TEXT_TEXT=Computer     : %COMPUTERNAME%"
@set "TEXT_COLOR=black"
@set /A TEXT_X=%TODO_X%+2
@set /A TEXT_Y=%TODO_Y%+2
@set TEXT=%TEXT% -fill %TEXT_COLOR% -stroke %TEXT_COLOR% %TEXT_FONT% -annotate +%TEXT_X%+%TEXT_Y% "%TEXT_TEXT%"
@set "TEXT_TEXT=User         : %USERNAME%"
@set "TEXT_COLOR=red"
@set /A TEXT_X=%TODO_X%+2
@set /A TEXT_Y=%TEXT_Y%+16
@set TEXT=%TEXT% -fill %TEXT_COLOR% -stroke %TEXT_COLOR% %TEXT_FONT%  -annotate +%TEXT_X%+%TEXT_Y% "%TEXT_TEXT%"
@set "TEXT_TEXT=Domain       : %USERDOMAIN%"
@set "TEXT_COLOR=green"
@set /A TEXT_X=%TODO_X%+2
@set /A TEXT_Y=%TEXT_Y%+16
@set TEXT=%TEXT% -fill %TEXT_COLOR% -stroke %TEXT_COLOR% %TEXT_FONT%  -annotate +%TEXT_X%+%TEXT_Y% "%TEXT_TEXT%"
@set "TEXT_TEXT=Snapsht time : %DATE% - %TIME%"
@set "TEXT_COLOR=green"
@set /A TEXT_X=%TODO_X%+2
@set /A TEXT_Y=%TEXT_Y%+16
@set TEXT=%TEXT% -fill %TEXT_COLOR% -stroke %TEXT_COLOR% %TEXT_FONT% -strokewidth 0.2 -annotate +%TEXT_X%+%TEXT_Y% "%TEXT_TEXT%"


:: Generate image
:: IMMG_CM Commands to pass to convert.exe that makes the big colored image
:: For debug purposes i put a echo first
@echo %CONVERT% %IMMG_CM% %TITLE% %RECT% %TEXT% %DEST_IMAGE%
@%CONVERT% %IMMG_CM% %TITLE% %RECT% %TEXT% %DEST_IMAGE%

:: Set image as wallpaper on windows
@%WPCHANGER% %DEST_IMAGE% 2

:: ------CLEAN
@del %MYPATH%\img_temp\*.bmp /Q 2> NUL
@del %MYPATH%\img_temp\*.jpg /Q 2> NUL
@del %MYPATH%\img_temp\*.jpeg /Q 2> NUL
@del %MYPATH%\img_temp\*.gif /Q 2> NUL
@del %MYPATH%\img_temp\*.txt /Q 2> NUL
::--------------------------------------------------------------------------