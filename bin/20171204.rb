require 'advent_of_code';

text = File.read('data/20171204.txt')

valid = 0

text.each_line do |line|
  if December4.check_passphrase(line) then
    valid += 1
  end
end

puts "Valid lines: #{valid}"

valid = 0

text.each_line do |line|
  if December4.check_passphrase_2(line) then
    valid += 1
  end
end

puts "Valid lines: #{valid}"