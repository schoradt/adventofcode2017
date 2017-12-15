# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December4
  def initialize
  end
  
  def process_step1(text)
    valid = 0

    text.each_line do |line|
      valid += 1 if check_passphrase(line)
    end
    
    valid
  end
  
  def process_step2(text)
    valid = 0

    text.each_line do |line|
      valid += 1 if check_passphrase_2(line)
    end
    
    valid
  end
  
  def check_passphrase(line)
    words = {}

    line.split.each do |word|
      return false unless words[word].nil?

      words[word] = 1
    end

    true
  end

  def check_passphrase_2(line)
    words = {}

    line.split.each do |word|
      hash = word.chars.sort.join

      return false unless words[hash].nil?

      words[hash] = 1
    end

    true
  end
end
