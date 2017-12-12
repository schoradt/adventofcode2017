# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December8
  def initialize(text)
    @registers = {}

    @registers_high = {}

    text.each_line do |line|
      data = line.split

      reg = data[0]
      num = data[2].to_i

      action = data[1]

      creg = data[4]
      ccond = data[5]
      cnum = data[6].to_i

      cregval = get_reg(creg)

      work = false

      if (ccond == '==' && cregval == cnum) ||
         (ccond == '>' && cregval > cnum) ||
         (ccond == '>=' && cregval >= cnum) ||
         (ccond == '<=' && cregval <= cnum) ||
         (ccond == '<' && cregval < cnum) ||
         (ccond == '!=' && cregval != cnum)
        work = true
      end

      if work
        if action == 'dec'
          set_reg(reg, get_reg(reg) - num)
        else
          set_reg(reg, get_reg(reg) + num)
        end
      end
    end
  end

  def get_reg(name)
    @registers[name] = 0 if @registers[name].nil?

    @registers[name]
  end

  def set_reg(name, value)
    @registers[name] = value

    if @registers_high[name].nil? || @registers_high[name] < value
      @registers_high[name] = value
    end
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
end
