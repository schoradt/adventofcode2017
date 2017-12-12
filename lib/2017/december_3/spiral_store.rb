##
# This class is the advent of code excercise for December the 2 2017.
class SpiralStore
  	
  def initialize()
    @store = []

    @dimen = 0
  end

  def SpiralStore.fill_spirals_to(max_address)
    ss = SpiralStore.new

    until ss.last_address >= max_address do
      ss.add_dimen
    end

    return ss
  end

	def SpiralStore.fill_neigbored(max_value)
    ss = SpiralStore.new

    v = ss.add
    until ss.last_address >= maxAddress do
      ss.add_dimen
    end

    return ss
  end  	

  def last_address
    if @dimen == 0 then
      return 0
    end

    return @store[-1][-1]
  end

  def dimen
    return @dimen
  end

  def add_dimen
    addr = self.last_address

    addr += 1

    s = @store.length

    if s == 0 then
      @store.push([1])

      @dimen += 1

      return @dimen
    end

    (s - 1).downto(0) do |i|
      #puts "push in line #{i} #{addr}"
      @store[i].push(addr)

      addr  += 1
    end

    n1 = Array.new(s + 2) { 0 }

    #puts "create n1 #{n1} - #{@dimen}"

    (s + 1).downto(0) do |i|
      #puts "set in col #{i} #{addr}"
        
      n1[i] = addr
        
      addr  += 1
    end
  		
    for i in 0..s-1
      #puts "unshift in line #{i} #{addr}"

      @store[i].unshift(addr)

      addr  += 1
    end

    n2 = Array.new(s + 2) { 0 }

    #puts "create n2 #{n2}"

		for j in 0..(s + 1)
			#puts "set in col #{i} #{addr}"

      n2[j] = addr

      addr  += 1
    end

    @store.unshift(n1)
    @store.push(n2)

    @dimen += 1
  end

  def store
    return @store
  end

  def address(x, y)
    return @store[x][y]
  end

  def x(v)
    if v == 1 then
      return @dimen - 1
    end

    if v > last_address then
      return nil
    end

    x1 = @dimen - 1
    y1 = @dimen - 1

    d = 1

    until self.address(x1 + d, y1 + d) >= v do 
      d += 1
    end

    (0).upto(d + 2) do |i|
      if self.address(x1 + d, y1 + d - i) == v then
        return x1 + d
      end

      if self.address(x1 - d, y1 + d - i) == v then
        return x1 - d
      end
    end

    (0).upto(d + 2) do |i|
      if self.address(x1 + d - i, y1 - d) == v then
        return x1 + d - i
      end

      if self.address(x1 + d - i, y1 + d) == v then
        return x1 + d - i
      end
		end
  		
    return nil
  end

  def y(v)
    if v == 1 then
      return @dimen - 1
    end

    if v > last_address then
      return nil
    end

    x1 = @dimen - 1
    y1 = @dimen - 1

    d = 1

    until self.address(x1 + d, y1 + d) >= v do 
      d += 1
    end

    (0).upto(d + 2) do |i|
      if self.address(x1 + d, y1 + d - i) == v then
        return y1 + d - i
      end

      if self.address(x1 - d, y1 + d - i) == v then
        return y1 + d - i
      end
    end

    (0).upto(d + 2) do |i|
      if self.address(x1 + d - i, y1 - d) == v then
        return y1 - d
      end

      if self.address(x1 + d - i, y1 + d) == v then
        return y1 + d
      end
		end
  		
    return nil
  end
end