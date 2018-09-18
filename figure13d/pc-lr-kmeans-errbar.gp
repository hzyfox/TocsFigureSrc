set terminal push
set terminal postscript eps solid color linewidth 2 "TimesNewRomanPSMT" 26
set output 'pc-lr-kmeans-errbar.eps'

set multiplot

set datafile separator ","
set style data histogram
set style histogram errorbars  gap 1
set style fill solid 0.4 border
set style fill pattern 4 border -1

set key left font ",27" at -0.8,145

set xlabel "APP / Data Size" font ",30" offset 0,-0.5

set xtics nomirror
set ytics nomirror
set ylabel "Cached Data (GB)" font ",30" offset 1.9,0
set yrange [0 : 145 ]
set ytics 0,20,140

set y2tics nomirror
set y2label "Execution Time (100s)" font ",30" offset -1.5,0
set y2range [-1:26]
set y2tics 0,5,25

set arrow 1 from graph 0,0 to graph 0,-1.0/6 nohead 
set arrow 2 from graph 1.0/2,0 to graph 1.0/2,-1.0/6 nohead 
set arrow 3 from graph 1,0 to graph 1,-1.0/6 nohead 

set arrow 4 from graph 1.0/4,0 to graph 1.0/4,-1.0/12 nohead 
set arrow 5 from graph 3.0/4,0 to graph 3.0/4,-1.0/12 nohead 

set key left font ",24" at -0.9,145

set xtic offset 0,0.4
set label "LR" at screen 0.3, 0.1
set label "KMeans" at screen 0.6,0.1

plot 'pc-lr-kmeans-cache-errbar.dat' using 3:4:xticlabels(2) title columnheader(3), \
     '' using 5:6:xticlabels(2) title columnheader(5),\
	 '' using 7:8:xticlabels(2) title columnheader(7),\
	 'pc-lr-kmeans-time-errbar.dat' using 1:($3/100):4:xticlabels(2) w yerrorlines pt 7 ps 0 lw 2 lc 6 axis x1y2 title columnheader(3), \
	 '' using 1:($5/100):6:xticlabels(2) w yerrorlines pt 7 ps 0 lw 2 lc 7 axis x1y2 title columnheader(5),\
	 '' using 1:($7/100):8:xticlabels(2) w yerrorlines pt 7 ps 0 lw 2 lc 8 axis x1y2 title columnheader(7)
unset key
unset border
unset multiplot

set output
#set terminal wxt
set terminal pop
