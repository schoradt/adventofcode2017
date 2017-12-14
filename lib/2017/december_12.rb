# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class December12
  class Node
    def initialize(id = 0)
      @edges = []

      @id = id
    end

    attr_reader :id
    attr_reader :edges

    def add_edge(child)
      @edges.push(child)
    end
  end

  def initialize
    @nodes= {}
  end
  
  def load(text)
    text.each_line do |line|
      data = line.split
      
      node = get_node(data[0].to_i)
      
      2.upto(data.length - 1) do |i|
        edge = get_node(data[i].to_i)
        
        node.add_edge(edge)
      end
    end
  end
  
  def process_step1
    node = get_node(0)
    
    group = [ node.id ]
    
    collect_group(node, group)
    
    group.length
  end
  
  def process_step2
    groups = []
    
    @nodes.each_value do |node|
      group = [ node.id ]
    
      collect_group(node, group)
      
      add = true
      
      groups.each do |g|
        if g.sort == group.sort
          add = false
        end
      end
      
      groups.push(group) if add
    end
    
    groups.length
  end
  
  private
  
  def get_node(id)
    if @nodes[id] == nil
      @nodes[id] = Node.new(id)
    end
    
    @nodes[id]
  end
  
  def collect_group(node, group)
    node.edges.each do |edge|
      if !(group.include? edge.id)
        group.push(edge.id)
        
        collect_group(edge, group)
      end
    end
  end
end
