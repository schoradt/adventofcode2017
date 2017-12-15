# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December10
  def initialize(size = 256)
    @data = Array.new(size) { |index| index }

    @pos = 0
    @skip = 0
  end

  def cycle(length)
    return false if length > @data.length

    reverse(length)

    @pos += length
    @pos += @skip

    @pos -= @data.length while @pos >= @data.length

    @skip += 1

    true
  end

  def hash
    @data[0] * @data[1]
  end

  attr_reader :data

  attr_reader :pos
  
  def knot_hash(text)
    lengths = prepare_input(text)
    
    knot_cycle(lengths)
    
    dense = dense_hash
    
    hex = dense.map{|x| '%02x'%x}.join

    return hex
  end
  
  private

  def reverse(size)
    r = @data.slice(@pos, size)

    r.concat(@data.slice(0, size - r.length)) if r.length < size

    r.reverse!

    p = @pos

    r.each_index do |i|
      @data[p] = r[i]

      p += 1

      p = 0 if p == @data.length
    end
  end
  
  def prepare_input(text)
    a = []
    
    text.chars.each do |c|
      a.push(c.ord)
    end
    
    a.push(17, 31, 73, 47, 23)
    
    return a
  end
  
  def knot_cycle(lengths)
    64.downto(1) do |i|
      lengths.each do |l|
        cycle(l)
      end
    end
  end
  
  def dense_hash
    a = []
    
    0.upto(15) do |i|
      x = @data[i*16]
      
      1.upto(15) do |j|
        x = x ^ @data[i * 16 + j]
      end
      
      a.push(x)
    end
    
    return a
  end
end
