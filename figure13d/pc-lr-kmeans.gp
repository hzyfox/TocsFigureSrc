set terminal push
set terminal postscript eps solid color linewidth 2 "TimesRoman" 26
set output 'pc-lr-kmeans.eps'

set multiplot

set datafile separator ","
set style data histogram
set style histogram clustered gap 1
set style fill solid 0.4 border
set style fill pattern 4 border -1

set key left font ",27" at -0.8,145

set xlabel "APP / Data Size" font ",30" offset 0,-0.5

set xrange [ -0.5 : 3.5 ]
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

set key left font ",27" at -0.9,145

set xtic offset 0,0.4
plot 'pc-lr-kmeans-cache.dat' using 3:xticlabels(2) title columnheader(3), \
     '' using 4:xticlabels(2) title columnheader(4),\
	 ''using 5:xticlabels(2) title columnheader(5),\
	 'pc-lr-kmeans-time.dat' using ($3/100):xticlabels(2) w lp pt 5 ps 3 lw 2 lc 6 axis x1y2 title columnheader(3), \
	 '' using ($4/100):xticlabels(2) w lp pt 7 ps 3 lw 2 lc 7 axis x1y2 title columnheader(4),\
	 ''using ($5/100):xticlabels(2) w lp pt 9 ps 3 lw 2 lc 8 axis x1y2 title columnheader(5)

set xtic offset 0,-0.8
set xtics ("LR" 0.5, "KMeans" 2.5)
#set xtics ("LR" 3.0/4*1.5, "KMeans" 3.0/4*3.5)

unset key
unset border
plot  "" u 1:xtic(6) w p pt 3 ps 0
	 
unset multiplot

set output
#set terminal wxt
set terminal pop
