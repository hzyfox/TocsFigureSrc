set terminal push
set terminal postscript eps solid color linewidth 2 "TimesNewRomanPSMT" 26
set output 'vst-cc-errbar.eps'
set datafile separator ","
set style data histogram
set style histogram errorbars gap 1
set style fill solid 0.4 border
set style fill pattern 4 border -1

set xtics nomirror
set xlabel "Data Size" font ",30" offset 0,0.3
set xrange [-0.5:2.5] 

set ytics nomirror
set ylabel "Execution Time(s)" font ",30" offset 1.5,0
set yrange [0 : 250]
set ytics 0,50,250

set y2tics nomirror
set y2label "GC Time (s)" font ",30" offset -1.5,0
set y2range [0:250]
set y2tics 0,50,250
set key left  spacing 1.2 font ",18" at -0.8,230

plot 'vst-cc-time-errbar.dat' using 2:3:xticlabels(1) title columnheader(2), \
     '' using 4:5:xticlabels(1) title columnheader(4),\
	 'vst-cc-gc-errbar.dat' using 1:($3):4:xticlabels(2) w yerrorlines pt 5 ps 0 lw 2 lc 6 axis x1y2 title columnheader(3), \
	 '' using 1:($5):6:xticlabels(2) w yerrorlines pt 7 ps 0 lw 2 lc 7 axis x1y2 title columnheader(5)

set output
#set terminal wxt
set terminal pop
