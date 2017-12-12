# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December9
  class Node
    def initialize(score = 0)
      @childs = []
      
      @parent = nil
      
      @score = score
    end
    
    def parent
      return @parent
    end
    
    def score
      score = @score
      
      @childs.each do |c|
        score += c.score
      end
      
      return score
    end
    
    def set_parent(parent)
      if @parent != nil then
        raise "parent already set"
      end
      
      @parent = parent
    end
    
    def add_child(child)
      child.set_parent(self)
      
      @childs.push(child)
    end
  end
  
  def initialize
    
  end
  
  def score(text)
    chars = text.chars
    
    root = nil
    node = nil
    score = 0
    
    pos = 0
    
    in_garbage = false
    
    while pos < chars.length do
      c = chars[pos]
      
      if in_garbage then
        if c == '>' then
          in_garbage = false
        elsif c == '!'
          pos += 1
        end
      elsif c == '{'
        score += 1
        
        t = Node.new(score)
        
        if root == nil then 
          root = t
        end
        
        if node != nil then
          node.add_child(t)
        end
        
        node = t
      elsif c == '}'
        node = node.parent
        
        score -= 1
      elsif c == '<'
        in_garbage = true
        
      end
      
      pos += 1
    end
    
    return root.score
  end
  
  def count_garbage(text)
    chars = text.chars
    
    garbage = 0
    
    pos = 0
    
    in_garbage = false
    
    while pos < chars.length do
      c = chars[pos]
      
      if in_garbage then
        if c == '>' then
          in_garbage = false
        elsif c == '!'
          pos += 1
        else
          garbage += 1
        end
      elsif c == '<'
        in_garbage = true
        
      end
      
      pos += 1
    end
    
    return garbage
  end
end
