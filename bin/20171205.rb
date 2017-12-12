require 'advent_of_code';

text = File.read('data/20171205.txt')

c = December5.new(text)

steps = 0

actual = 0

until actual < 0 do
  #puts "#{steps}: position #{actual}"
  
  steps += 1
  
  actual = c.process(actual)
end

puts "processor jumps out after #{steps} steps"

c = December5.new(text)

steps = 0

actual = 0

until actual < 0 do
  #puts "#{steps}: position #{actual}"
  
  steps += 1
  
  actual = c.process2(actual)
end

puts "processor jumps out after #{steps} steps"