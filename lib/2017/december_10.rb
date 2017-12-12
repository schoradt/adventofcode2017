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
end
