REM Simple batch script to run PcbDraw on Windows environment to draw kicad projects.
REM This example creates plot for both sides of the pcb.
REM For more information about PcbDraw please check the [oficial repository](https://github.com/yaqwsx/PcbDraw).

REM author:     Andre Leopoldino
REM date:       2023-01-26
REM license:    MIT License

@echo off

REM config variables
SET ROOT_FILENAME=pwm-interface-board
SET FILE_PATH=./example/
SET CONFIG=--drill-holes --style jlcpcb-green-hasl
REM could be .svg, .png or .jpeg
SET OUTPUT_EXTENSION=.png

REM default instalation path for v6
set KICAD_CONFIG_HOME=C:\Program Files\KiCad\6.0\bin\

REM Generating argument file
@echo @echo off>tmpfile
@echo cd "%cd%">>tmpfile
@echo @echo ******** Drawing front side ********>>tmpfile

REM The pcbdraw command goes here
@echo pcbdraw plot %FILE_PATH%%ROOT_FILENAME%.kicad_pcb %FILE_PATH%%ROOT_FILENAME%-front%OUTPUT_EXTENSION% --side front %CONFIG%>>tmpfile

@echo @echo ******** Drawing back side ********>>tmpfile

REM Another pcbdraw command goes here
@echo pcbdraw plot %FILE_PATH%%ROOT_FILENAME%.kicad_pcb %FILE_PATH%%ROOT_FILENAME%-back%OUTPUT_EXTENSION% --side back %CONFIG%>>tmpfile

REM Running kicad-cmd
%comspec% /k "%KICAD_CONFIG_HOME%kicad-cmd.bat" /k <tmpfile

REM cleanning tmp file
del tmpfile

REM end of file