# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December13
  def initialize
    @layers = []
    
    @positions = []
    @up = []
    
    @catches = []
    
    @packet = -1
  end
  
  def process_step1
    init
    
    until done do
      simulate_step
      
      #puts "step --------------"
      #puts "#{@positions}"
      #puts "#{@packet}"
      #puts "#{@catches}"
    end
    
    sev = 0
    
    @catches.each do |c|
      sev += c * @layers[c]
    end
    
    return sev
  end
  
  def process_step2
    presteps = 0
    
    until false do
      init
      
      presteps.downto(1) do |i|
        delay_step
      end
      
      until done do
        simulate_step
      end
      
      if @catches.length == 0
        return presteps
      end
      
      puts "    #{presteps} delay -> #{@catches.length}"
      
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
  attr_reader :positions
  attr_reader :catches
  
  def init
    @catches.clear
    @positions.clear
    
    @layers.each_index do |i|
      if @layers[i] != nil
        @positions[i] = 0
      else
        @positions[i] = -1
      end
      
      @up[i] = true
    end
    
    @packet = -1
  end
  
  def delay_step
    move_scanners
  end
  
  def simulate_step
    move_packet
    test_catches
    move_scanners
  end
  
  def done
    if @packet >= @layers.length
      return true
    end
    
    return false
  end
  
  private
  
  def move_packet
    @packet += 1
  end
  
  def test_catches
    if @packet >= 0 && @packet < @positions.length
      if @positions[@packet] == 0
        @catches.push(@packet)
      end
    end
  end
  
  def move_scanners
    @layers.each_index do |i|
      if @layers[i] != nil
        if @positions[i] == @layers[i] - 1 
          @up[i] = false
        end
        
        if @positions[i] == 0 
          @up[i] = true
        end
        
        if @up[i]
          @positions[i] += 1
        else
          @positions[i] -= 1
        end
      end
    end
  end
end
