set terminal push
set terminal postscript eps color solid linewidth 3 "TimesNewRomanPSMT" 26

set output 'compression-errbar.eps'
set size 1.2,1
set style data histogram
set style histogram rowstack gap 1
set style fill solid 0.4 border
set style fill pattern 4 border -1
set boxwidth 0.5
set bars large

set ylabel "Data Size (GB)" font ",30" offset 1.4,0
set yrange [0:70]
set ytics 0,10,70

set y2label "Execution time(s)" font ",30" offset -1.4,0
set y2range [0:700]
set y2tics 0,100,700

plot newhistogram " " lt 2, 'compression.dat' u 2:xtic(1) title columnhead(2) ls 1, '' u 3 title columnhead(3) ls 6,\
   "compression2-errbar.dat" with yerrorlines t "ExecutionTime" axis x1y2 ls 6 lw 2 lc 7

set output
set terminal pop
