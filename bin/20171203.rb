require 'advent_of_code'

puts "Advent 2017/12/03"

ss = December3.fill_spirals_to(277_678)

sum = December3.manchester_distance(ss, 277_678)

puts "Step 1: #{sum}"

sum = December3.fill_neigbored(277_678)

puts "Step 2: #{sum}"
