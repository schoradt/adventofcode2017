# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December4
  def December4.check_passphrase(line)
    words = Hash.new
    
    line.split.each do |word|
      if words[word] != nil then
        return false
      end
      
      words[word] = 1
    end
    
    return true
  end
  
  def December4.check_passphrase_2(line)
    words = Hash.new
    
    line.split.each do |word|
      hash = word.chars.sort.join
      
      if words[hash] != nil then
        return false
      end
      
      words[hash] = 1
    end
    
    return true
  end
end
