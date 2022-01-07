#!/usr/bin/env ruby
require 'json'
words = eval(open('./wordles.txt').readline(chomp: true))

# Options:
# t=.....     match template, 5 chars, use '.' for unknown
# i=letters   letters that need to be included
# x=letters   letters that need to not be included
opts={}
ARGV.each{|p| opts[$~[1]]=$~[2] if /([tix])=(.*)/.match(p)}
words = words.grep(Regexp.new(opts["t"])) if opts.has_key?("t")
words = words.grep_v(Regexp.new("[#{opts["x"]}]")) if opts.has_key?("x")
if opts.has_key?("i")
  e = opts["i"].each_char.drop(1).map{|x|"(?=.*#{x})"}. join('')+".*#{opts['i'][0]}"
  words = words.grep(Regexp.new(e))
end

char_weight= words.map{|w|w.each_char.to_a}.transpose.map{|x|Hash[x.tally]}
word_weight = words.map {|w|[w, w.each_char.zip(char_weight).map{|c,w|w[c]}.sum]}
puts word_weight.sort_by{|_,x|x}.reverse.map(&:first).take(12).join(", ")
#puts char_weight.map{|x| x.sort_by{|k,v|v}.reverse.take(20).map{|k,v| "%s:%4.2f"%[k,v.to_f/words.count]}}.transpose.map{|x|x.join(" || ")}
