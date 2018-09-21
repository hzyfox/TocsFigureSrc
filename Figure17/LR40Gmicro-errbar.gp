set terminal push
set terminal postscript eps solid color linewidth 3 "TimesNewRomanPSMT" 26
set size 0.8,0.9
set output 'LR40Gmicro-errbar.eps'
set datafile separator " "
set style data histogram
set style histogram rowstacked
set boxwidth 0.5 relative
set style fill solid 0.4 border
set style fill pattern 4 border -1

set xtics nomirror
#set xlabel "App" font ",30" offset 0,0.3
#set xrange[1:3]
 
set ytics nomirror
#set logscale y
set ylabel "Time (s)" font ",30" offset 2,0
set yrange[0:2.6]

set key left font ",28" at 0,2.5

plot 'LR40Gmicro-errbar.dat' using 2:xticlabels(1) title "Compute time",\
     '' using 4:xticlabels(1) title "GC time",\
     '' using 6:2:3:xticlabels(1) w yerrorbars notitle,\
     '' using 6:($4+$2):5:xticlabels(1) w yerrorbars notitle

set output
#set terminal wxt
set terminal pop
