require 'advent_of_code'

text = File.read('data/20171210.txt')

hash = December10.new(256)

data = text.split(',').map(&:to_i)

data.each do |l|
  hash.cycle(l)
end

h = hash.hash

puts "Hash is #{h}"

text = File.read('data/20171210.txt')

knot = December10.new(256)

kh = knot.knot_hash(text)

puts "Knot Hash is #{kh}"
