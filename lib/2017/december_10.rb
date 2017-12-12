# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December10
  def initialize(size)
    @data = Array.new(size) { |index| index }
    
    @pos = 0
    @skip = 0
  end
  
  def cycle(length)
    if length > @data.length then 
      return false
    end
    
    reverse(length)
    
    @pos += length
    @pos += @skip
    
    while @pos >= @data.length do
      @pos = @pos - @data.length
    end
    
    @skip += 1
    
    return true
  end
  
  def hash 
    return @data[0] * @data[1]
  end
  
  def data
    return @data
  end
  
  def pos
    return @pos
  end
  
  private
  def reverse(size)
    r = @data.slice(@pos, size)
    
    if r.length < size then
      r.concat(@data.slice(0, size - r.length))
    end
    
    r.reverse!
    
    p = @pos
    
    r.each_index do |i|
      @data[p] = r[i]
      
      p += 1
      
      if p == @data.length then
        p = 0
      end
    end
  end
end
