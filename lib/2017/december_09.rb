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

    attr_reader :parent

    def score
      score = @score

      @childs.each do |c|
        score += c.score
      end

      score
    end

    def set_parent(parent)
      raise 'parent already set' unless @parent.nil?

      @parent = parent
    end

    def add_child(child)
      child.set_parent(self)

      @childs.push(child)
    end
  end

  def initialize; end

  def score(text)
    chars = text.chars

    root = nil
    node = nil
    score = 0

    pos = 0

    in_garbage = false

    while pos < chars.length
      c = chars[pos]

      if in_garbage
        if c == '>'
          in_garbage = false
        elsif c == '!'
          pos += 1
        end
      elsif c == '{'
        score += 1

        t = Node.new(score)

        root = t if root.nil?

        node.add_child(t) unless node.nil?

        node = t
      elsif c == '}'
        node = node.parent

        score -= 1
      elsif c == '<'
        in_garbage = true

      end

      pos += 1
    end

    root.score
  end

  def count_garbage(text)
    chars = text.chars

    garbage = 0

    pos = 0

    in_garbage = false

    while pos < chars.length
      c = chars[pos]

      if in_garbage
        if c == '>'
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

    garbage
  end
end
