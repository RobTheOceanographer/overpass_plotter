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

#################################
## DECLARE YOUR VARIABLES HERE ##
#################################
  SCALE=15                  # make plot 15 cm across
  LONMIN=120. ; LONMAX=170. # Longitude range of plots
  LATMIN=-60.  ; LATMAX=-35. # Latitude range of plots
  OUTFILE='mymap.ps'                 # Output file


#pscoast -R$LONMIN/$LONMAX/$LATMIN/$LATMAX -JM$SCALE -B10a20WSen -Dl -Na -A1000 -W2 -Y10 -X2 -P > $OUTFILE

# gmtset PLOT_DEGREE_FORMAT ddd:mm:ssF
# gmtset DEGREE_SYMBOL none

# The only command of this plot
#pscoast -Jl15/35/30/60/1:20000000 -R-15/45/35/70 -A0/0/1 -Ba5g5/a5g5nSEW:."Europe": -Ggrey > map.eps
#pscoast -JM$SCALE -R$LONMIN/$LONMAX/$LATMIN/$LATMAX -A0/0/1 -B -Ggrey > map.eps
# -B  a = majr tick spacing, g= gridline spacing,



psbasemap -R-120/-60/20/50 -JM5 -Ba30/a15 -P -K -X1.5 -Y5 > map.eps

# To convert the EPS file into png
#convert -density 100 map.eps map.png

exit 0
