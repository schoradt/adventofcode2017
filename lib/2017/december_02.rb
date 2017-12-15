##
# This class is the advent of code excercise for December the 2 2017.
class December2
  ##
  # Compute the checksum of the spredsheet.
  #
  # The checksum of the spreadsheet is the sum of the difference of
  # the maximum and the minimum of each line.
  def self.checksum(text)
    sum = 0

    ss = December2.parse_spreadsheet(text)

    ss.each do |line|
      cs = line.max - line.min

      sum += cs
    end

    sum
  end

  ##
  # Compute the checksum of the spredsheet.
  #
  # The checksum is the sum of the lines checksums.
  # The checksum of a line is the division of the two
  # evenly (mod 0) dividable elements of the line.
  def self.checksum2(text)
    sum = 0

    ss = December2.parse_spreadsheet(text)

    ss.each do |line|
      cs = December2.compute_line_2(line)

      sum += cs
    end

    sum
  end

  def self.compute_line_2(line)
    line.each_with_index do |number, index|
      line.last(line.length - index - 1).each do |number2|
        if number > number2
          return number / number2 if number % number2 == 0
        else
          return number2 / number if number2 % number == 0
        end
      end
    end

    0
  end

  ##
  # The functions parses the +text+ into an array of arrays representing the spreadsheet.
  def self.parse_spreadsheet(text)
    ss = []

    text.each_line do |line|
      ss.push(December2.parse_line(line))
    end

    ss
  end

  ##
  # The functions parses +line+ into an array of integers.
  def self.parse_line(line)
    line.split(' ').map(&:to_i)
  end
end
