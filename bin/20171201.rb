#!/usr/bin/ruby

require 'AdventOfCode';

text = File.read('data/20171201.txt')

sum = December1.sumMatching(text)

puts "sum of matches : #{sum}"

sum = December1.sumMatching2(text)

puts "sum of matches 2 : #{sum}"
