# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December5
  def initialize(text)
    @jumps = text.split.map(&:to_i)
  end

  attr_reader :jumps

  def process_step1
    steps = 0

    actual = 0

    until actual < 0
      # puts "#{steps}: position #{actual}"

      steps += 1

      actual = process(actual)
    end

    steps
  end
  
  def process_step2
    steps = 0

    actual = 0

    until actual < 0
      # puts "#{steps}: position #{actual}"

      steps += 1

      actual = process2(actual)
    end
    
    steps
  end
  
  
  def process(pos)
    return -1 if pos < 0 || pos >= @jumps.length

    steps = @jumps[pos]

    @jumps[pos] += 1

    n = pos + steps

    return -1 if n < 0 || n >= @jumps.length

    n
  end

  def process2(pos)
    return -1 if pos < 0 || pos >= @jumps.length

    steps = @jumps[pos]

    if @jumps[pos] >= 3
      @jumps[pos] -= 1
    else
      @jumps[pos] += 1
    end

    n = pos + steps

    return -1 if n < 0 || n >= @jumps.length

    n
  end
end
