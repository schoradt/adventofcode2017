require_relative './december_3/spiral_store'

##
# This class is the advent of code excercise for December the 2 2017.
class December3
  def December3.fill_spirals_to(max_address)
    ss = SpiralStore.new

    1.upto(max_address) do |i|
      ss.set(i, i)
    end

    return ss
  end
  
  def December3.manchester_distance(ss, address)
    dist = (ss.y(address) - ss.y(1)).abs + (ss.x(address) - ss.x(1))
    
    return dist
  end
  
  def December3.fill_neigbored(max_value)
    ss = SpiralStore.new

    v = 1
    a = 1
    
    until v > max_value do
      #puts "set #{a} with #{v}"
      
      ss.set(a, v)
      
      a += 1
      
      v = December3.compute_neigbours(ss, a)
    end
    
    return v
  end
  
  def December3.compute_neigbours(ss, address)
    until ss.last_address >= address do
      ss.add_dimen
    end
    
    x = ss.x(address)
    y = ss.y(address)
    
    v = 0
    
    -1.upto(1) do |i|
      -1.upto(1) do |j|
        v0 = ss.value(x + i, y + j)
        
        if v0 != nil then
          v += v0
        end
      end
    end
    
    return v
  end
end