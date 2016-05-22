## Build basic graph structure - 3rd approach.
## Add the edge when creating the vertex/node.
## Store the nodes in a hash.

class Graph
  attr_reader :nodes

  def initialize
    @nodes = {}
  end

  # Provides flexibility to specify multiple edges like so...
  # graph.add_node('node_one', {'node_two' => 5, 'node_three' => 6})
  def add_node(value, edges)
    nodes[value] = edges
  end

  # Provide method for easy formatting in the terminal.
  def show
    puts nodes
  end
end

## A super simple implementation of a 'Priority Queue' to use in below shortest path.
## Sort the arr in asc order and then return the last el.
## I.e. the one with the highest priority.
class PriorityQueue
  attr_reader :queue

  def initialize
    @queue = queue
  end

  def add(element)
    queue << element
  end

  ## Before popping sort it into the priority.
  ## Returns the last el
  ## Modifies the queue to remove this item.
  ## Very inefficient approach as the queue size grows.
  def pop
    queue.sort!
    queue.delete_at(queue.size - 1)
  end
end

## Implements class to find the shortest path from a source node to another node.
class ShortestPath
  attr_reader :source_node, :graph

  def initialize(graph, source_node)
    @source_node = source_node
    @graph = graph
    @queue = PriorityQueue.new
  end

  def get_shortest_path_to(node)
    ## This may be redundant. Revisit.
    if source_node_contains_direct_route_to?(node)
      ## Return the value of the edge between source node and the node we want to reach.
      return source_node[1][node[0]]
    else
      nodes_to_visit = []
      nodes_to_visit << source_node

      while nodes_to_visit.size > 0
        current_node = nodes_to_visit.first

        current_node[1].keys.each do |child_node|
          ## Add each of these child nodes to the front - i.e. Depth First search.
          ## A similar approach with breadth first could just add to the end of the array.
          nodes_to_visit.unshift(graph.nodes[child_node])
        end

        ## Do something
      end
    end
  end

  ## To simplify, I am making the assumption that the
  ## direct route is the shortest in this graph.
  def source_node_contains_direct_route_to?(node)
    source_node[1].keys.include?(node[0]) ? true : false
  end
end

