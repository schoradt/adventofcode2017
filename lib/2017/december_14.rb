# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December14
  def initialize
    
  end
  
  def process_step1(text)
    used = 0
    
    0.upto(127) do |i|
      key = text + '-' + i.to_s
      
      hex = December10.new.knot_hash(key)
      
      bin = to_bin(hex)
      
      #puts "KH: #{key} - #{hex} - #{bin}"
      
      bin.each_char do |c|
        if c == '1' 
          used += 1
        end
      end
    end
    
    used
  end
  
  def process_step2(text)
    used = 0
    
    matrix = []
    
    0.upto(127) do |i|
      key = text + '-' + i.to_s
      
      hex = December10.new.knot_hash(key)
      
      bin = to_bin(hex)
      
      a = bin.chars.to_a.map(&:to_i)
      
      matrix.push(a)
    end
    
    regions = Array.new(128){ |i| Array.new(128) { |j| 0 } }
    
    region = 1
    
    rmap = {}
    
    0.upto(127) do |i2|
      0.upto(127) do |j2|
        if matrix[i2][j2] == 1
          r1 = regions[i2 - 1][j2]
          r2 = regions[i2][j2-1]
          
          if r1 == 0 && r2 != 0
            regions[i2][j2] = r2
            
            rmap[r2].push({ 'x' => i2, 'y' => j2 })
          elsif r1 != 0 && r2 == 0
            regions[i2][j2] = r1
            
            rmap[r1].push({ 'x' => i2, 'y' => j2 })
          elsif r1 == 0 && r2 == 0
            regions[i2][j2] = region
            
            rmap[region] = [{ 'x' => i2, 'y' => j2 }]
            
            region += 1
          elsif r1 != 0 && r2 != 0 && r1 == r2
            regions[i2][j2] = r1
            
            rmap[r1].push({ 'x' => i2, 'y' => j2 })
          elsif r1 != 0 && r2 != 0 && r1 != r2
            regions[i2][j2] = r1
            
            rmap[r1].push({ 'x' => i2, 'y' => j2 })
            
            rmap[r2].each do |p|
              regions[p['x']][p['y']] = r1
            
              rmap[r1].push(p)
            end
            
            rmap.delete(r2)
          end
        end
      end
    end
    
    rmap.keys.length
  end
  
  private
  
  def to_bin(hex)
    bin = ''
    
    hex.each_char do |c|
      bin += c.to_i(16).to_s(2).rjust(4, '0')
    end
    
    bin
  end
end
