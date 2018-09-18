set terminal push
set terminal postscript eps solid color linewidth 2 "TimesNewRomanPSMT" 26
set output 'wc-2-errbar.eps'

set multiplot

set key left font ",30"
#set ylabel "Execution Time (1000s)" font ",30" offset 1.5,0
set ylabel "Execution Time (1000s)" font ",30" offset 1.5,0
set xlabel "Data Size / Key Size" font ",30" offset 0,-0.6

set xrange [ 0.5 : 6.5 ]
set yrange [-0.5 : 6]
set xtics nomirror

set arrow 1 from graph 0,0 to graph 0,-1.0/6 nohead 
set arrow 2 from graph 1.0/2,0 to graph 1.0/2,-1.0/6 nohead 
set arrow 3 from graph 1,0 to graph 1,-1.0/6 nohead 

set arrow 4 from graph 1.0/6,0 to graph 1.0/6,-1.0/12 nohead 
set arrow 5 from graph 2.0/6,0 to graph 2.0/6,-1.0/12 nohead 
set arrow 6 from graph 4.0/6,0 to graph 4.0/6,-1.0/12 nohead 
set arrow 7 from graph 5.0/6,0 to graph 5.0/6,-1.0/12 nohead 

set key left font ",27" at 0.3,6

set xtic offset 0,0.4


plot "wc-2-errbar.dat" u 1:($3/1000):4:xtic(2) title columnheader(3) pt 7 ps 1 lw 2 lc 6  w yerrorlines, \
"wc-2-errbar.dat" u 1:($5/1000):6 title columnheader(5) pt 9 ps 1 lw 2 lc 7 w yerrorlines

set xtic offset 0,-0.9

unset key
#unset border


plot    "" u 1:xtic(7) w p pt 3 ps 0

unset multiplot
unset xlabel
unset ylabel
set output
set terminal pop
