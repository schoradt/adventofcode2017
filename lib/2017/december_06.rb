# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December6
  def initialize(text)
    @banks = text.split.map(&:to_i)

    @configs = {}
  end

  attr_reader :banks

  def redistribute
    index = 0
    blocks = 0

    @banks.each_with_index do |block_value, block_index|
      if block_value > blocks
        index = block_index
        blocks = block_value
      end
    end

    @banks[index] = 0

    until blocks == 0
      index += 1

      index = 0 if index == @banks.length

      @banks[index] += 1
      blocks -= 1
    end

    hash = @banks.join('|')

    @configs.each_key do |key|
      @configs[key] += 1
    end

    @configs[hash] = 0 if @configs[hash].nil?

    @configs[hash]
  end
end
