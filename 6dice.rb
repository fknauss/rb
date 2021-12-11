#!/usr/bin/env ruby -wU

def chk?(a,b)
  a.combination(b).any?{|y|y.sum==a.sum/2}
end
a=(1..6).to_a
b = a.product(*([a]*5)).select do |x|
  s = x.sum
  s%2==0&&(1..3).inject(false){|c,v|c||chk?(x,v)}
end
puts "%d of %d (%f)"%[b.length,a.length**6,b.length.to_f/(a.length**6)]
