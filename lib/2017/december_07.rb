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

    def check_balance
      weights = {}

      puts "check balance of node #{@name}"

      @childs.each do |c|
        w = c.tree_weight

        if weights[w].nil?
          weights[w] = [c]
        else
          weights[w].push(c)
        end
      end
      res = true

      if weights.keys.length > 1
        puts "node #{@name} is unbalanced"

        res = false

        weights.each_key do |w|
          puts "    #{w} -> "
          weights[w].each { |n| puts '            ' + n.weight.to_s }
        end
      end

      weights.each_key do |w|
        weights[w][0].check_balance if weights[w].length == 1
      end

      res
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

  attr_reader :root
end