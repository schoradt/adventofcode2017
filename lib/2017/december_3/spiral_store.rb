##
# This class is the advent of code excercise for December the 2 2017.
class SpiralStore
  def initialize
    @store = []

    @dimen = 0
  end

  def set(address, value)
    add_dimen until last_address >= address

    x = x(address)
    y = y(address)

    if x.nil? || y.nil?
      puts "error in setting value to #{address}"

      return nil
    end

    @store[x][y] = value
  end

  def get(address)
    return nil if address > last_address

    @store[x(address)][y(address)]
  end

  def last_address
    @store.length**2
  end

  attr_reader :dimen

  def add_dimen
    s = @store.length

    if s == 0
      @store.push([nil])

      @dimen += 1

      return @dimen
    end

    (s - 1).downto(0) do |i|
      # puts "push in line #{i} #{addr}"
      @store[i].push(nil)
    end

    n1 = Array.new(s + 2) { 0 }

    # puts "create n1 #{n1} - #{@dimen}"

    (s + 1).downto(0) do |i|
      # puts "set in col #{i} #{addr}"

      n1[i] = nil
    end

    for i in 0..s - 1
      # puts "unshift in line #{i} #{addr}"

      @store[i].unshift(nil)
    end

    n2 = Array.new(s + 2) { 0 }

    # puts "create n2 #{n2}"

    for j in 0..(s + 1)
      # puts "set in col #{i} #{addr}"

      n2[j] = nil
    end

    @store.unshift(n1)
    @store.push(n2)

    @dimen += 1
  end

  attr_reader :store

  def value(x, y)
    return 0 if x < 0 || y < 0

    return 0 if x >= @store.length || y >= @store.length

    @store[x][y]
  end

  def x(v)
    return @dimen - 1 if v == 1

    return nil if v > last_address

    x1 = @dimen - 1

    d = 1
    kl = 1

    until kl**2 >= v
      d += 1
      kl += 2
    end

    d -= 1

    # puts "X0 #{x1} #{d}"

    a = kl**2
    # puts "X1 #{a} #{kl}"
    0.upto(kl - 1) do |i|
      return x1 + d if a - i == v
    end

    a -= (kl - 1)
    # puts "X2 #{a} #{kl}"
    0.upto(kl - 1) do |i|
      return x1 + d - i if a - i == v
    end

    a -= (kl - 1)
    # puts "X3 #{a} #{kl}"
    0.upto(kl - 1) do |i|
      return x1 - d if a - i == v
    end

    a -= (kl - 1)
    # puts "X4 #{a} #{kl}"
    0.upto(kl - 1) do |i|
      return x1 - d + i if a - i == v
    end

    nil
  end

  def y(v)
    return @dimen - 1 if v == 1

    return nil if v > last_address

    y1 = @dimen - 1

    d = 1
    kl = 1

    until kl**2 >= v
      d += 1
      kl += 2
    end

    d -= 1

    a = kl**2

    0.upto(kl - 1) do |i|
      return y1 + d - i if a - i == v
    end

    a -= (kl - 1)

    0.upto(kl - 1) do |i|
      return y1 - d if a - i == v
    end

    a -= (kl - 1)

    0.upto(kl - 1) do |i|
      return y1 - d + i if a - i == v
    end

    a -= (kl - 1)

    0.upto(kl - 1) do |i|
      return y1 + d if a - i == v
    end

    nil
  end
end
