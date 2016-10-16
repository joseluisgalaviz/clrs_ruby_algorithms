
class Vertex
  attr_reader :name
  attr_accessor :color,:distance,:ancestor,:neighbour

  def initialize(name)
    @name=name
    @neighbour = []
  end

  def add_neighbour(n)
    @neighbour<<n
  end

  def get_neighbours()
    @neighbour
  end
end


class Node
  attr_reader :name
  attr_accessor :color,:distance,:parent

  def initialize(name)
    @name=name
    @successors=[]
  end

  def get_successors()
    @successors
  end

  def get_name()
    @name
  end

  def add_edge(successor)
    @successors<<successor
  end

  def to_s
    "#{@name} -> [#{@successors.map(&:name).join(' ')}]"
  end
end


class Graph
  def initialize
    @nodes={}
  end

  def add_node(node)
    @nodes[node.name]=node;
  end

  def add_edge(predecessor_name,successor_name)
    @nodes[predecessor_name].add_edge(@nodes[successor_name])
  end

  def [](name)
    @nodes[name]
  end

  def nodes()
    @nodes
  end

end


def BFS(_G,s)
  _G.nodes.each do |u|
    if(u[1].get_name!=s.get_name)
      u[1].color='WHITE'
      u[1].distance=Float::INFINITY
      u[1].parent=nil
    else
      u[1].color='GRAY'
      u[1].distance=0
      u[1].parent=nil
    end
  end

  queue = Queue.new
  queue<<s

  while !queue.empty?
    u=queue.pop
    u.get_successors.each do |v|
      if v.color=='WHITE'
        v.color='GRAY'
        v.distance=u.distance+1
        v.parent=u
        queue<<v
      end
    end
    u.color='BLACK'
  end

  _G.nodes.each do |u|
    print "#{u[1].name} #{u[1].distance}\n"
  end

end

s = Node.new('u')
graph = Graph.new
graph.add_node(s)
graph.add_node(Node.new('y'))
graph.add_node(Node.new('x'))
graph.add_node(Node.new('t'))
graph.add_node(Node.new('w'))
graph.add_node(Node.new('s'))
graph.add_node(Node.new('r'))
graph.add_node(Node.new('v'))
graph.add_edge('u', 'y')
graph.add_edge('u', 'x')
graph.add_edge('u', 't')
graph.add_edge('y', 'x')
graph.add_edge('t', 'x')
graph.add_edge('x', 'w')
graph.add_edge('t', 'w')
graph.add_edge('w', 's')
graph.add_edge('s', 'r')
graph.add_edge('r', 'v')

BFS(graph,s)
