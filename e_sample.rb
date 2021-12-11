#!/usr/bin/env ruby -wU
N=4096
puts N.to_f/(N-Array.new(N){rand(N)}.uniq.length)
