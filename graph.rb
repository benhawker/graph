## A (sketchy) implementation of a Graph class. A WIP.

class Graph
  attr_reader :nodes

  def initialize
    @nodes = []
  end

  def add_node(value)
    nodes << Node.new(value)
  end

  def add_edge(node_one, node_two, edge_value, direction)
    one = nodes.index { |node| node.value == node_one }
    two = nodes.index { |node| node.value == node_two }

    # edge = Edge.new(nodes[one], nodes[two], edge_value, direction)
    nodes[one].connected_nodes[two] = edge_value
  end

  def find_node(value)
    nodes.each do |node|
      return node if node.value == value
    end
    nil
  end
end

## Could also be class Vertex. i.e. A point in the graph.
class Node
  attr_accessor :value, :connected_nodes

  def initialize(value)
    @value = value
    ## Connected nodes will contain a k,v pair. For the given node a hash of {connected_node => value, connected_node2 => value}
    @connected_nodes = {}
  end
end