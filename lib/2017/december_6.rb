# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December6
  def initialize(text)
    @banks = text.split.map(&:to_i)
    
    @configs = {}
  end
  
  def banks 
    return @banks
  end
  
  def redistribute
    index = 0
    blocks = 0
    
    @banks.each_with_index do |block_value, block_index|
      if block_value > blocks then
        index = block_index
        blocks = block_value
      end
    end
    
    @banks[index] = 0
    
    until blocks == 0 do
      index += 1
      
      if index == @banks.length then
        index = 0
      end
      
      @banks[index] += 1
      blocks -= 1
    end
    
    hash = @banks.join('|')
    
    if @configs[hash] != nil then
      return false
    end
    
    @configs[hash] = 0
    
    return true
  end
end
