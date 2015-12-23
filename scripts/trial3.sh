#!/usr/bin/env bash

######################################################################
##
## DATE:         Dec 2015
## AUTHOR:       Robert Johnson robtheoceanographer@gmail.com
## VERSION:      0.01
## LANGUAGE:     bash/GMT
##
## USAGE:
##
## PURPOSE:
##
######################################################################

######################################################################
## DECLARE YOUR SHIPS POSITION HERE.
######################################################################
SHIPLAT=-44.74298
SHIPLON=145.5313

  # -44.74298 / 145.5313

# TODO: Need to get the ship position from somewhere else - command line?

######################################################################
## DECLARE YOUR MAP VARIABLES HERE.
######################################################################
# set the image centre for the proj:
CENTLON=$SHIPLON
CENTLAT=$SHIPLAT

# set up the spatial boundaries of each corner of the plot:
LONMIN=$(echo $SHIPLON-20 | bc) ; LONMAX=$(echo $SHIPLON+15 | bc) # Longitude range of plots
LATMIN=$(echo $SHIPLAT-10 | bc)  ; LATMAX=$(echo $SHIPLAT+10 | bc) # Latitude range of plots

# set the filename.
OUTFILE='mymap.eps'                 # Output file

######################################################################
## MODIFY YOUR STYLE VARIABLES HERE.
######################################################################
gmtset FORMAT_GEO_MAP ddd:mm:ssF MAP_GRID_CROSS_SIZE_PRIMARY 0
gmtset MAP_GRID_PEN_PRIMARY 0.5p,grey,-
gmtset ANNOT_FONT_SIZE_PRIMARY 8
gmtset ANNOT_FONT_PRIMARY Courier,black

######################################################################
## DO YOUR PLOTTING HERE.
######################################################################
# pscoast -R130/-52/160/-36r -JA150/-30/3i -Bag5 -Di -A500 -G -Wthinnest -P -X3 > map3.eps
pscoast -R$LONMIN/$LATMIN/$LONMAX/$LATMAX'r' -JA$CENTLON/$CENTLAT/3i -Bag5 -Di -A500 -G -Wthinnest -P -K > map3.eps

## next line:
# command variables -K -O >> map3.eps

## last line:
# command variables -O >> map3.eps
psxy text.xy -R -J -SS0.1 -Gred -O -K >> map3.eps

#Add some text to the bottom of the figure.
pstext text2.xy -R -J -N -O >> map3.eps

#echo $(130,-60,$DATE) | pstext -R -J -N -O >> map3.eps

######################################################################
## CONVERT THE EPS TO A PNG HERE.
######################################################################
# convert to png and crop while we're at it.
psconvert -A1 -Tg map3.eps

exit 0
