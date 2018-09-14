set terminal push
set terminal postscript eps color solid linewidth 3 "TimesRoman" 26
set output 'lr.eps'
set size 1.2,1
set style data histogram
set style histogram rowstack gap 1
set style fill solid 0.4 border
set style fill pattern 4 border -1
set boxwidth 0.5
set bars large
set datafile separator ","


set ylabel "Time(s)" font ",30" offset 1.4,0
set yrange [0:70]
set ytics 0,10,60

set xlabel "JVM Heap Size"

plot newhistogram " " lt 2, 'lr.dat' u 2:xtic(1) title columnhead(2) ls 1, '' u 3 title columnhead(3) ls 6
set output
