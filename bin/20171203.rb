require 'advent_of_code';

ss = December3.fill_spirals_to(277678)

sum = December3.manchester_distance(ss, 277678)

puts "checksum: #{sum}"

sum = December3.fill_neigbored(277678)

puts "checksum: #{sum}"
