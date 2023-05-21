#!/usr/bin/env ruby -wU
Integer.class_eval do
    def factors; 1.upto(Math.sqrt(self)).select{(self%_1).zero?}; end
    def fact_pairs; a=self.factors; a.zip(a.map{self/_1}); end
end

class Dice
    attr_accessor :dice, :rolls
    def initialize(d=nil, r=nil)
        @dice= d || [Array.new(6){rand(1..20)}, Array.new(6){rand(1..20)}]
        @rolls = r || Array.new(100){dice.map(&:sample).inject(&:*)}
    end
    def freq
        @rolls.inject(Hash.new(0)){|p,v| p[v] += 1; p}
    end
    def compare(d)
        m = (d[0].product(d[1])).map{|(a,b)|a*b}
        u = @rolls.length/36.0
        f = m.inject(Hash.new(0)){|p,v| p[v] += u; p}
        return nil if (freq.keys - f.keys).length>0
        var=f.keys.inject(0){|c,v|c+(freq[v]-f[v])**2}
        Math.sqrt(var/rolls.length).round(4)
    end
end