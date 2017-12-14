# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December11
  class Cube
    def initialize
      @x = 0
      @y = 0
      @z = 0
    end
    
    attr_reader :x
    attr_reader :y
    attr_reader :z
    
    def from_axial(q, r)
      @x = q
      @y = -q - r
      @z = r
    end
    
    def distance(c)
      return ((x - c.x).abs + (y - c.y).abs + (z - c.z).abs) / 2
    end
  end
  def initialize
    @x = 0
    @y = 0
  end
  
  def December11::process_step1(text)
    hex = December11.new
    
    p = text.split(',')
    
    text.split(',').each do |step|
      case step
      when "s"
        hex.south
      when "se"
        hex.southeast
      when "sw"
        hex.southwest
      when "n"
        hex.north
      when "ne"
        hex.northeast
      when "nw"
        hex.northwest
      end
    end
    
    #puts "(#{hex.x}, #{hex.y}) -> (#{hex.cube.x}, #{hex.cube.y}, #{hex.cube.z})"
    
    return hex.cube.distance(Cube.new)
  end
  
  def December11::process_step2(text)
    hex = December11.new
    
    max = 0
    
    text.split(',').each do |step|
      case step
      when "s"
        hex.south
      when "se"
        hex.southeast
      when "sw"
        hex.southwest
      when "n"
        hex.north
      when "ne"
        hex.northeast
      when "nw"
        hex.northwest
      end
      
      dist = hex.cube.distance(Cube.new)
      
      max = dist if dist > max
    end

    return max
  end
  
  attr_reader :x
  attr_reader :y
  
  def north
    @y -= 1
    
    self
  end
  
  def northeast
    @x += 1
    @y -= 1
    
    self
  end
  
  def northwest
    @x -= 1
    
    self
  end
  
  def south
    @y += 1
    
    self
  end
  
  def southeast
    @x += 1
    
    self
  end
  
  def southwest
    @x -= 1
    @y += 1
    
    self
  end
  
  def cube
    c = Cube.new
    
    c.from_axial(@x, @y)
    
    c
  end
end
