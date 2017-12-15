#!/usr/bin/ruby

require 'advent_of_code'

puts "Advent 2017/12/01"

text = File.read('data/20171201.txt')

res1 = December1.sum_matching(text)

puts "Step1: #{res1}"

res2 = December1.sum_matching_2(text)

puts "Step2: #{res2}"

