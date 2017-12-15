##
# This class is the advent of code excercise for December the 1 2017.
class December1
  ##
  # The function computes the sum of integers from the string,
  # that matches its predecessor.
  def self.sum_matching(text)
    sum = 0

    last_number = 0

    text.each_char do |char|
      number = char.to_i

      sum += last_number if number == last_number

      last_number = number
    end

    number = text[0].to_i

    sum += last_number if number == last_number

    sum
  end

  ##
  # The function computes the sum of integers from the string,
  # that matches half list around predecessor.
  def self.sum_matching_2(text)
    sum = 0

    line = []

    text.each_char do |char|
      line.push(char.to_i)
    end

    check_index = line.length / 2

    line.each_with_index do |number, _index|
      check = line[check_index]

      sum += number if number == check

      check_index += 1

      check_index = 0 if check_index == line.length
    end

    sum
  end
end
