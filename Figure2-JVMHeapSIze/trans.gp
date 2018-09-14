set terminal push
set terminal postscript eps color solid linewidth 3 "TimesRoman" 26
set output 'trans.eps'
set size 1.2,1
set style data histogram
set style histogram rowstack gap 1
set style fill solid 0.4 border
set style fill pattern 4 border -1
set boxwidth 0.5
set bars large
set datafile separator ","


set ylabel "Time(s)" font ",30" offset 1.4,0
set yrange [0:1]
set ytics 0,0.2,0.8

set xlabel "BandWidth"

plot newhistogram " " lt 2, 'trans.dat' u 2:xtic(1) title columnhead(2) ls 1, '' u 3 title columnhead(3) ls 6, '' u 4 title columnhead(4) ls 6 
set output
