set terminal push
set terminal postscript eps solid color linewidth 2 "TimesRoman" 26
set output 'lr.eps'
set datafile separator ","
set style data histogram
set style histogram clustered gap 1
set style fill solid 0.4 border
set style fill pattern 4 border -1

set xtics nomirror
set xlabel "Data Size" font ",30" offset 0,0.3
 
set ytics nomirror
set ylabel "Cached Data (GB)" font ",30" offset 1.9,0
set yrange [0 : 200 ]
set ytics 0,20,200

set y2tics nomirror
set y2label "Execution Time (1000s)" font ",30" offset -1.5,0
set y2range [-0.5:16]
set y2tics 0,2,16

set key left font ",28" at -1.6,200

plot 'lr-cache.dat' using 2:xticlabels(1) title columnheader(2), \
     '' using 3:xticlabels(1) title columnheader(3),\
	 ''using 4:xticlabels(1) title columnheader(4),\
	 'lr-time.dat' using ($2/1000.0):xticlabels(1) w lp pt 5 ps 3 lw 2 lc 6 axis x1y2 title columnheader(2), \
	 '' using ($3/1000.0):xticlabels(1) w lp pt 7 ps 3 lw 2 lc 7 axis x1y2 title columnheader(3),\
	 ''using ($4/1000.0):xticlabels(1) w lp pt 9 ps 3 lw 2 lc 8 axis x1y2 title columnheader(4)

set output
#set terminal wxt
set terminal pop
