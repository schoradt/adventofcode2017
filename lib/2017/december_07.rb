# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December7
  class Node
    def initialize(name)
      @name = name

      @childs = []

      @parent = nil

      @weight = 0
    end

    attr_reader :name

    attr_reader :parent

    attr_reader :weight

    def set_parent(parent)
      raise 'parent already set' unless @parent.nil?

      @parent = parent
    end

    def set_weight(weight)
      @weight = weight
    end

    def add_child(child)
      child.set_parent(self)

      @childs.push(child)
    end

    def tree_weight
      weight = @weight

      @childs.each { |c| weight += c.tree_weight }

      weight
    end

    def check_balance(diff = 0)
      weights = {}

      @childs.each do |c|
        w = c.tree_weight

        if weights[w].nil?
          weights[w] = [c]
        else
          weights[w].push(c)
        end
      end

      wall = 0
      wmis = 0
      
      if weights.keys.length > 1
        weights.each_key do |w|
          wmis = w if weights[w].length == 1
          wall = w if weights[w].length > 1
        end
        
        weights.each_key do |w|
          if weights[w].length == 1
            res = weights[w][0].check_balance()

            if res == 0
              return  weights[w][0].weight + (wall - wmis)
            end 
            
            return res
          end
        end
      end

      return 0
    end
  end

  def initialize(text)
    nodes = {}

    text.each_line do |line|
      # puts "parse line #{line}"

      data = line.split

      name = data[0]

      node = nodes[name]

      if node.nil?
        node = Node.new(name)

        nodes[name] = node
      end

      weight = data[1].delete('()').to_i
      node.set_weight(weight)

      next unless data.length > 2
      3.upto(data.length - 1) do |i|
        cname = data[i].chomp(',')

        child = nodes[cname]

        if child.nil?
          child = Node.new(cname)

          nodes[cname] = child
        end

        node.add_child(child)
      end
    end

    @root = nil

    nodes.each_key do |name|
      @root = nodes[name] if nodes[name].parent.nil?
    end
  end

  def process_step1
    root.name
  end
  
  def process_step2
    root.check_balance
  end
  
  attr_reader :root
end
