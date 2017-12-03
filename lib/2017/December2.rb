##
# This class is the advent of code excercise for December the 2 2017.
class December2
  ##
  # Compute the checksum of the spredsheet.
  #
  # The checksum of the spreadsheet is the sum of the difference of 
  # the maximum and the minimum of each line.
  def December2.checksum(text)
    sum = 0

    ss = December2.parseSpreadsheet(text)

    ss.each do |line|
      cs = line.max - line.min

      sum += cs
    end

    sum
  end

  ##
  # The functions parses the +text+ into an array of arrays representing the spreadsheet.
  def December2.parseSpreadsheet(text)
    ss = [];

    text.each_line do |line|
      ss.push(December2.parseLine(line))
    end

    ss
  end

  ##
  # The functions parses +line+ into an array of integers.
  def December2.parseLine(line)
    line.split(" ").map(&:to_i)
  end

end
