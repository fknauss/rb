#!/usr/bin/env ruby -wU

def from_pi(a)
  (bef,aft)=a.split(".")
  bef.each_char.inject(0){|a,x|a*Math::PI+x.to_i}+
  aft.each_char.inject([0,1.0]){|(v,p),x| p/=Math::PI;[v+x.to_i*p,p]}.first
end

PI_FACTOR=(Math::PI-1)/3.0

def log_pi(x)
  Math::log(x,Math::PI)
end

def pi_frugal(x,p=10)
  l=[Math::PI ** log_pi(x*PI_FACTOR).floor,1.0].max
  #ignore x<1 for now
  r=[]
  while l> Math::PI**(-p) do
    t = (x*PI_FACTOR/l).floor
    r << t.to_s
    r << "." if l == 1
    x -= t*l
    l /= Math::PI
  end
  r.join

end

def pi_greedy(x,p=10)
   l=[Math::PI ** log_pi(x).floor,1.0].max
   #ignore x<1 for now
   r=[]
   while l> Math::PI**(-p) do
     t = (x/l).floor
     r << t.to_s
     r << "." if l == 1
     x -= t*l
     l /= Math::PI
   end
   r.join
end

g = pi_greedy(10,20)
puts g,from_pi(g)

f= pi_frugal(10,20)
puts f, from_pi(f)
