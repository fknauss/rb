#!/usr/bin/env ruby

include Math

def euler(x0,y0,h)
  Enumerator.new do |y|
    loop do
      y << [x0,y0]
      m= yield(x0,y0)
      x0 += h
      y0 += h*m
    end
  end
end

DATA.each_line(chomp: true) do |s|
  x,y,h,n,f=*(s.split(','))
  puts "y' = %s, starting at (%.2f, %.2f), by %.2f, %d times."%[f,x,y,h,n]
  euler(x.to_f,y.to_f,h.to_f){|x,y|eval(f)}.take(n.to_i+1).each{|p| puts "(%.3f, %.3f)"%p} 
end

__END__
0, 2, 0.1, 10, x+y
0, 2, 0.05, 20, x+y
0, 3, 0.05, 10, 3*x-2*y
0, 1, 0.4, 5,0.5*x*(3-y)
0, 1, 0.1, 10, exp(x*y)
0,5, 0.1, 10, cos(x)+sin(y)
