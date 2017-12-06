require 'AdventOfCode';

ss = SpiralStore.fillSpiralsTo(277678)

sum = (ss.getY(277678) - ss.getY(1)).abs + (ss.getX(277678) - ss.getX(1))

puts "checksum: #{sum}"
