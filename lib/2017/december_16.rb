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
    @data = @data.slice!(-size..-1).reverse!.concat(@data) 
    
    true
  end
  
  def exchange(a, b)
    @data[a], @data[b] = @data[b], @data[a]
    
    true
  end
  
  def partner(a, b)
    exchange(@data.index(a), @data.index(b))
    
    true
  end
  
  def dance(steps)
     steps.each do |step|
      case step[0]
      when 0
        spin(step[1])
      when 1
        #@data[step[1]], @data[step[2]] = @data[step[2]], @data[step[1]]
        exchange(step[1], step[2])
      when 2
        partner(step[1], step[2])
      end
    end
    
    true
  end
  
  def prepare(text)
    steps = text.split(',')
    
    res = []
    
    steps.each do |step|
      res.push(parse_step(step))
    end
    
    res
  end
  
  private 
  
  def parse_step(step)
    action = step[0]
    
    res = [] #.push(action)
    
    case action
    when 's'
      #puts "s: #{step[1..-1]}"
      res.push(0)
      x = step[1..-1].to_i
      
      res.push(x)
    when 'x'
      res.push(1)
      x = step[1 .. step.index('/') - 1].to_i
      y = step[step.index('/') + 1..-1].to_i
      
      res.push(x)
      res.push(y)
    when 'p'
      res.push(2)
      x = step[1..step.index('/')-1]
      y = step[step.index('/') + 1 .. -1]
      
      res.push(x)
      res.push(y)
    end
    
    res
  end
end
