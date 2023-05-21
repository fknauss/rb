#!/usr/bin/env ruby -wU

DECK = (1..9).to_a

def trial(x)    # determine best score if [x] cards have been dealt
    # Get score of passed in card list
    s0 = x.empty? ? 0 : x.reverse.slice_when{_1>_2}.first.sum

    # check possible scores if pulling another card 
    undealt = DECK - x
    return s0 if undealt.length==0

    # average all possible best scores from remaining draws,
    # and use current score if average is lower, i.e. stay
    [s0, undealt.map{trial([*x, _1])}.sum.to_f/undealt.length].max
end

puts trial([])

