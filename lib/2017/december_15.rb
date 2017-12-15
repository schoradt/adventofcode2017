# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December15
  def initialize(a, b)
    @last_a = a
    @last_b = b
    
    @factor_a = 16807
    @factor_b = 48271
  end
  
  def process_step1
    pairs = 0
    
    40000000.downto(0) do |i|
      generate_a
      generate_b
      
      if test 
        pairs += 1
      end
    end
    
    pairs
  end
  
  def process_step2
    pairs = 0
    
    5000000.downto(0) do |i|
      generate_a2
      generate_b2
      
      if test 
        pairs += 1
      end
    end
    
    pairs
  end
  
  def generate_a
    @last_a = (@last_a * @factor_a) % 2147483647
    
    @last_a
  end
  
  def bin_a
    @last_a.to_s(2).rjust(32, '0')
  end
  
  def generate_b
    @last_b = (@last_b * @factor_b) % 2147483647
    
    @last_b
  end
  
  def bin_b
    @last_b.to_s(2).rjust(32, '0')
  end
  
  def generate_a2
    @last_a = (@last_a * @factor_a) % 2147483647
    
    until @last_a % 4 == 0 do
      @last_a = (@last_a * @factor_a) % 2147483647
    end
    
    @last_a
  end
  
  def generate_b2
    @last_b = (@last_b * @factor_b) % 2147483647
    
    until @last_b % 8 == 0 do
      @last_b = (@last_b * @factor_b) % 2147483647
    end
    
    @last_b
  end
  
  def test
    if @last_a & 65535 == @last_b & 65535
      return true
    end
    
    false
  end
  
end
