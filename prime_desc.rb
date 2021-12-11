#!/usr/bin/env ruby -wU
require 'prime'


def ps(n,b)
   Prime.each(n).select{|p| p.digits(b).map{|x|x*x}.sum.prime?}.count
end
puts "Out of the first %d primes"%Prime.each(100).count
(2..16).each {|x| puts "base %d: %d psds"%[x,ps(100,x)]}
