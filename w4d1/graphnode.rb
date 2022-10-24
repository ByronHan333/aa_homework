require 'set'
class GraphNode
  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = Array.new
  end

  def bfs(starting_node, target_value)
    visited = Set.new [starting_node]
    queue = [starting_node]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      node.neighbors.each do |n|
        queue << n
        visited.add(n)
      end
    end
    return nil
  end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p a.bfs(a, 'd')
