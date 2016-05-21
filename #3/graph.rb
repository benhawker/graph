## Build basic graph structure - 3rd approach.
## Add the edge when creating the vertex/node.
## Store the nodes in a hash.

class Graph
  attr_reader :nodes

  def initialize
    @nodes = {}
  end

  # Provides flexibility to specify multiple edges like so...
  # graph.add_vertex('node_one', {'node_two' => 5, 'node_three' => 6})
  def add_node(value, edges)
    nodes[value] = edges
  end

  # Provide method for easy formatting in the terminal.
  def show
    puts nodes
  end
end

## A super simple implementation of a 'Priority Queue' to for shortest path.
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
  def pop
    queue.sort!
    queue.delete_at(queue.size - 1)
  end
end

