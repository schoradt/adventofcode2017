# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December5
  def initialize(text)
    @jumps = text.split.map(&:to_i)
  end
  
  def jumps
    return @jumps
  end
  
  def process(pos)
    if pos < 0 || pos >= @jumps.length then
      return -1
    end
    
    steps = @jumps[pos]
    
    @jumps[pos] += 1
    
    n = pos + steps
    
    if n < 0 || n >= @jumps.length then
      return -1
    end
    
    return n
  end
  
  def process2(pos)
    if pos < 0 || pos >= @jumps.length then
      return -1
    end
    
    steps = @jumps[pos]
    
    if (@jumps[pos] >= 3) then
      @jumps[pos] -= 1
    else
      @jumps[pos] += 1
    end
    
    n = pos + steps
    
    if n < 0 || n >= @jumps.length then
      return -1
    end
    
    return n
  end
end
