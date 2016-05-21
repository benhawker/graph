##Build basic graph structure.
class Graph
  attr_reader :nodes, :edges

  def initialize
    @nodes = []
    @edges = []
  end

  def add_node(node)
    nodes << node
  end

  def add_edge(from, to, value)
    edges << Edge.new(from, to, value)
  end
end

##Define a node class.
##Initialize a node before inserting into the graph.
class Node
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

##Define a node class
class Edge
  attr_reader :from, :to, :value

  def initialize(from, to, value)
    @from   = from
    @to     = to
    @value  = value
  end
end