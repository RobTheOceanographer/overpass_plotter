#!/usr/bin/env bash


# set the image centre:
CENTLON=150
CENTLAT=-30

# set up the spatial boundaries:
LONMIN=130. ; LONMAX=160 # Longitude range of plots
LATMIN=-52  ; LATMAX=-36 # Latitude range of plots

# set the filename.
OUTFILE='mymap.eps'                 # Output file



gmtset FORMAT_GEO_MAP ddd:mm:ssF MAP_GRID_CROSS_SIZE_PRIMARY 0

gmtset MAP_GRID_PEN_PRIMARY 0.5p,grey,-
gmtset ANNOT_FONT_SIZE_PRIMARY 7

# gmt pscoast -R0/-40/60/-10r -JA30/-30/4.5i -Bag -Dl -A500 -Gp300/10 \
#             -Wthinnest -P > map3.eps

#pscoast -R130/-52/160/-36r -JA150/-30/3i -Bag5 -Di -A500 -G -Wthinnest -P -X3 > map3.eps
pscoast -R$LONMIN/$LATMIN/$LONMAX/$LATMAX'r' -JA$CENTLON/$CENTLAT/3i -Bag5 -Di -A500 -G -Wthinnest -P > map3.eps

# $LONMIN/$LATMIN/$LONMAX/$LATMAX'r'

# convert to png and crop while we're at it.
psconvert -A1 -Tg map3.eps

exit 0
