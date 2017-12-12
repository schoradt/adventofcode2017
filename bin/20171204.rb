require 'advent_of_code'

text = File.read('data/20171204.txt')

valid = 0

text.each_line do |line|
  valid += 1 if December4.check_passphrase(line)
end

puts "Valid lines: #{valid}"

valid = 0

text.each_line do |line|
  valid += 1 if December4.check_passphrase_2(line)
end

puts "Valid lines: #{valid}"
