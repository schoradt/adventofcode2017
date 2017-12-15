##
# Class for december 8th exercise.
class December8
  def initialize(text)
    @registers = {}

    @registers_high = {}

    text.each_line do |line|
      process_line(line)
    end
  end

  def get_reg(name)
    @registers[name] = 0 if @registers[name].nil?

    @registers[name]
  end

  def set_reg(name, value)
    @registers[name] = value

    @registers_high[name] = value if @registers_high[name].nil? || @registers_high[name] < value
  end

  def registers
    @registers.keys
  end

  def max_value
    max = nil

    @registers.each_value do |v|
      max = v if max.nil? || max < v
    end

    max
  end

  def highest_value
    max = nil

    @registers_high.each_value do |v|
      max = v if max.nil? || max < v
    end

    max
  end

  private

  def check_condition(cond, left, right)
    return true if cond == '==' && left == right
    return true if cond == '>=' && left >= right
    return true if cond == '<=' && left <= right
    return true if cond == '<' && left < right
    return true if cond == '>' && left > right
    return true if cond == '!=' && left != right

    false
  end

  def process_line(line)
    data = line.split

    reg = data[0]
    num = data[2].to_i

    action = data[1]

    if check_condition(data[5], get_reg(data[4]), data[6].to_i)
      if action == 'dec'
        set_reg(reg, get_reg(reg) - num)
      else
        set_reg(reg, get_reg(reg) + num)
      end
    end
  end
end
