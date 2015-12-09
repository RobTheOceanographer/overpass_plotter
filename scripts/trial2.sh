#!/usr/bin/env bash


LONMIN=130. ; LONMAX=170. # Longitude range of plots
LATMIN=-60.  ; LATMAX=-35. # Latitude range of plots

# LONMIN=165. ; LONMAX=180. # Longitude range of plots
# LATMIN=-47.5.  ; LATMAX=-34. # Latitude range of plots
OUTFILE='mymap.eps'                 # Output file

gmtset MAP_GRID_PEN_PRIMARY 0.5p,grey,-

pscoast -R$LONMIN/$LONMAX/$LATMIN/$LATMAX -JD172.5/-90/-44/-36/15 -G -S -B10g5 -Di -W0.5p,grey -P -X3 -Y7  > map2.eps
# -B  a = majr tick spacing, g= gridline spacing,


exit 0
