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
          (ccond == '!=' && cregval != cnum) then
        work = true
      end 
      
      if work then
        if action == 'dec' then
          set_reg(reg, get_reg(reg) - num)
        else
          set_reg(reg, get_reg(reg) + num)
        end
      end
    end
  end
  
  def get_reg(name)
    if @registers[name] == nil then
      @registers[name] = 0
    end
    
    return @registers[name]
  end
  
  def set_reg(name, value)
    @registers[name] = value
    
    if @registers_high[name] == nil || @registers_high[name] < value then
      @registers_high[name] = value
    end
  end
  
  def registers
    return @registers.keys
  end
  
  def max_value
    max = nil
    
    @registers.each_value do |v|
      if max == nil || max < v then
        max = v
      end
    end
    
    return max
  end
  
  def highest_value
    max = nil
    
    @registers_high.each_value do |v|
      if max == nil || max < v then
        max = v
      end
    end
    
    return max
  end
end
