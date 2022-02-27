# frozen_string_literal: true

require './lib/knight.rb'
require './lib/path.rb'

class PathFinder
  def self.update_queue_with(current_path)
    queue = []
    moves = Knight.all_valid_moves[(current_path.destination)]
    
    moves.delete_if { |move| move == current_path.source }

    moves.each do |move|
      queue << Path.new(current_path.destination, move)
    end
    queue
  end

  def self.finished?(destination, queue, completed_paths)
    return false if completed_paths.empty?
    return true if queue.empty?
    
    completed_paths.any? do |completed_path|
      completed_path.destination == destination
    end
  end

  def self.paths_to(destination, source)
    current_path = Path.new(nil, source)
    queue = PathFinder.update_queue_with(current_path)
    completed_paths = []
     until PathFinder.finished?(destination, queue, completed_paths)
      current_path = queue.shift
      unless Path.completed?(current_path, completed_paths)
        queue += PathFinder.update_queue_with(current_path)
        completed_paths << current_path
      end
    end
    completed_paths
  end

  def self.shortest_path(destination, source)
    paths = PathFinder.paths_to(destination, source)
    shortest_path = []
    current_edge = paths.pop
    
    until paths.empty?
      target = current_edge.source
      next_edge = paths.pop
      next unless next_edge.destination == target
  
      shortest_path << current_edge
      current_edge = next_edge
    end
    shortest_path << current_edge
    shortest_path.reverse
  end

  def self.path_cost(destination, source)
    PathFinder.shortest_path(destination, source).length.to_s
  end
end