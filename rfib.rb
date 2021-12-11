#!/usr/bin/env ruby -wKU

def fib(a,b)
  Enumerator.new do |y|
    loop do
      y << a;
      a, b = b, a+b;
    end
  end
end

def rfib(a,b)
  Enumerator.new do |y|
    loop do
      y << a;
      a, b = b, a-b;
    end
  end
end

puts rfib(1,1).take(20)
