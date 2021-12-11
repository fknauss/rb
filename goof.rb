#!/usr/bin/env ruby -wU

#triangle = Enumerator.new {|y| a=i=0; loop{y<< a+=(i+=1)} }

def collatz(n)
  Enumerator.new do|y|
    while (y<<n;n>1) do
      n = n.even? ? n/2 : 3*n+1
    end
  end
end

#puts triangle.take(8)
#puts collatz(27).to_a


#Integer.class_eval {def div?(x) x!= 0 && self%x == 0;end}
#puts (10**5..10**6).select{|x| x.div?(x.digits.sum) && x.div?(x.digits.inject(1,&:*))}.count

def tohr(f,t,c,y)
  if c>0
    tohr(f,3-f-t,c-1,y)
    y << [f,t]
    tohr(3-f-t,t,c-1,y)
  end
end

def toh(c,f=0,t=1)
  Enumerator.new{|y|tohr(f,t,c,y)}
end

CNT=4
#b=[(1..CNT).to_a.reverse,[],[]]
#b.each {|x| puts "|"+x.join(' ')}; puts
#toh(CNT,0,2).each do |(f,t)|
#  b[t].push(b[f].pop)
#  b.each {|x| puts "|"+x.join(' ')};puts
#end

def greedy_base(n,b,p=10)
  cp=b**(Math.log(n,b).floor).to_f
  lim=b.**(-p)
  r=[]
  while cp>lim
    r.push((n/cp).floor).to_s
    r.push(".") if cp==1
    n%=cp
    cp/=b
  end
  r.join
end

g= greedy_base(10,Math::PI,60)
puts g
