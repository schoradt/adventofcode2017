require 'advent_of_code';

ss = SpiralStore.fill_spirals_to(277678)

sum = (ss.y(277678) - ss.y(1)).abs + (ss.x(277678) - ss.x(1))

puts "checksum: #{sum}"
