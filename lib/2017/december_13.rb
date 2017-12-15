# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December13
  def initialize
    @layers = []
  end
  
  def process_step1
    cs = []
    
    0.upto(@layers.length - 1) do |i|
      if @layers[i] != nil
        if (i % (2 * (@layers[i] - 1))) == 0
          cs.push(i)
        end
      end
    end
    
    sev = 0
    
    cs.each do |c|
      sev += c * @layers[c]
    end
    
    return sev
  end
  
  def process_step2
    presteps = 0
    cs = []
    
    until false do
      cs.clear
      
      0.upto(@layers.length - 1) do |i|
        if @layers[i] != nil
          if ((i + presteps) % (2 * (@layers[i] - 1))) == 0
            cs.push(i)
          end
        end
      end
      
      if cs.length == 0
        return presteps
      end
      
      presteps += 1
    end
  end
  
  def load(text)
    text.each_line do |line|
      data = line.split
      
      depth = data[0].chomp(':').to_i
      range = data[1].to_i
      
      @layers[depth] = range
    end
  end
  
  attr_reader :layers
end
