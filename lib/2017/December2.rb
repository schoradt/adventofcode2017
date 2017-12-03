

class December2
  def December2.checksum(text)
    sum = 0

    ss = December2.parseSpreadsheet(text)

    ss.each do |line|
      cs = line.max - line.min

      sum += cs
    end

    sum
  end

  def December2.parseSpreadsheet(text)
    ss = [];

    text.each_line do |line|
      ss.push(December2.parseLine(line))
    end

    ss
  end

  def December2.parseLine(line)
    line.split(" ").map(&:to_i)
  end

end
