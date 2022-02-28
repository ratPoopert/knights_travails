# frozen_string_literal: true

require './lib/knight.rb'
require './lib/path.rb'

class PathFinder
  def initialize(source, destination, adjacency_list)
    @source = source.freeze
    @destination = destination.freeze
    @adjacency_list = adjacency_list.freeze
    @pending = Queue.new
    @shortest_path = shortest_path
    @cost = cost
  end

  def update_pending
    next_nodes.each do |node|
      @pending << Path.new(@current_path.destination, node)
    end
  end

  def next_nodes
    @adjacency_list[@current_path.destination].reject do |node|
      node == @current_path.source
    end
  end

  def finished?
    return false if @completed.empty?
    return true if @pending.empty?
    
    @completed.any? do |completed_path|
      completed_path.destination == @destination
    end
  end

  def find_paths
    @completed = []
    @current_path = Path.new(nil, @source)
    update_pending
     until finished?
      @current_path = @pending.shift
      unless @current_path.completed?(@completed)
        update_pending
        @completed << @current_path
      end
    end
  end

  def shortest_path
    find_paths
    paths = @completed
    @current_path = paths.pop
    
    until paths.empty?
      shortest_path = [] unless shortest_path
      next_path = paths.pop
      next unless next_path.destination == @current_path.source
  
      shortest_path << @current_path
      @current_path = next_path
    end
    shortest_path << @current_path
    shortest_path.reverse
  end

  def cost
    @shortest_path.length
  end
end