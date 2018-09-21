set terminal push
set terminal postscript eps solid color linewidth 2 "TimesNewRomanPSMT" 26
set output 'lr-errbar.eps'
set datafile separator ","
set style data histogram
set style histogram errorbars gap 1
set style fill solid 0.4 border
set style fill pattern 4 border -1
set xtics nomirror
set xtics rotate by -45
set xlabel "Data Size" font ",30" offset 0,0.3
 
set ytics nomirror
set ylabel "Cached Data (GB)" font ",30" offset 1.9,0
set yrange [0 : 200 ]
set ytics 0,20,200

set y2tics nomirror
set y2label "Execution Time (1000s)" font ",30" offset -1.5,0
set y2range [-0.5:18]
set y2tics 0,2,18

set key left font ",24" at -1.6,200

plot 'lr-cache-errbar.dat' using 2:3:xticlabels(1) title columnheader(2), \
     '' using 4:5:xticlabels(1) title columnheader(4),\
	 ''using 6:7:xticlabels(1) title columnheader(6),\
	 'lr-time-errbar.dat' using 1:($3/1000.0):4:x2ticlabels(2) w yerrorlines pt 5 ps 1 lw 2 lc 6 axis x1y2 title columnheader(3), \
	 '' using 1:($5/1000.0):6:x2ticlabels(2) w yerrorlines pt 7 ps 1 lw 2 lc 7 axis x1y2 title columnheader(5),\
	 '' using 1:($7/1000.0):8:x2ticlabels(2) w yerrorlines pt 9 ps 1 lw 2 lc 8 axis x1y2 title columnheader(7)



set output
#set terminal wxt
set terminal pop
