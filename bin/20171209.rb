require 'advent_of_code';

text = File.read('data/20171209.txt')

scorer = December9.new

score = scorer.score(text)

puts "Text group score is #{score}"

garbage = scorer.count_garbage(text)

puts "Garbage count is #{garbage}"
