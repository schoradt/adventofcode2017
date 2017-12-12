require 'advent_of_code';

text = File.read('data/20171206.txt')

c = December6.new(text)

steps = 0

cycle = 0

while (cycle = c.redistribute) == 0  do
  #puts "#{steps}: position #{actual}"
  
  steps += 1
end

steps += 1

puts "loop in redistribute after #{steps} steps with a cycle of #{cycle}"
