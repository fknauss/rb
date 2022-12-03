#!/usr/bin/env ruby

#a has all valid 21 pt 6 sided dice
a= (0..21).to_a.repeated_combination(6).
            filter{|s| s.sum==21}.
            map{|s| s.sort}.
            uniq
# face off, empty die on a tie 

b=a.combination(2).map{
            |p| c=p[0].product(p[1]).map{|e|e[0]<=>e[1]}.sum;
            c==0?[[],[]]: c>0 ? p : p.reverse
          }.transpose
        
bw=b[0].tally
bl=b[1].tally
          

m = a.map{|d| (bw[d]||0)-(bl[d]||0)}.zip(a).
    sort_by{|x|-x[0]}.
    each{|x| w=(bw[x[1]]||0);l=(bl[x[1]]||0);
      puts "#{x[1]}: #{x[0]} (w: #{w} l: #{l})"}
