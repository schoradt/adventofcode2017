# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December16
  def initialize
    @data = []
  end
  
  def init(text)
    @data = text.chars
  end
  
  def to_s
    @data.join('')
  end
  
  def spin(size)
    size.downto(1) do 
      x = @data.delete_at(-1)
      @data.unshift(x)
    end
    true
  end
  
  def exchange(x, y)
    ex = @data[x]
    @data[x] = @data[y]
    @data[y] = ex
    
    true
  end
  
  def partner(a, b)
    exchange(@data.index(a), @data.index(b))
    
    true
  end
  
  def dance(text)
    steps = text.split(',')
    
    steps.each do |step|
      parse_step(step)
    end
    
    true
  end
  
  private 
  
  def parse_step(step)
    action = step[0]
    
    case action
    when 's'
      #puts "s: #{step[1..-1]}"
      x = step[1..-1].to_i
      
      spin(x)
    when 'x'
      x = step[1 .. step.index('/') - 1]
      y = step[step.index('/') + 1..-1]
      
      #puts "x #{x} #{y}"
      
      exchange(x.to_i, y.to_i)
    when 'p'
      x = step[1..step.index('/')-1]
      y = step[step.index('/') + 1 .. -1]
      
      #puts "x #{x} #{y}"
      
      partner(x, y)
    end
  end
end
