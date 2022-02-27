# frozen_string_literal: true

class ChessBoard
  def self.coordinates_list
    (1..8).to_a.repeated_permutation(2).to_a
  end

  def self.square_name(coordinates)
    file_name_index = coordinates[0] - 1
    rank = coordinates[1]
    file_name = ("a".."h").to_a[file_name_index]
    rank_name = rank.to_s
    "#{file_name}#{rank_name}".to_sym
  end

  def self.squares
    squares = {}
    coordinates_list = self.coordinates_list
    coordinates_list.map do |coordinates|
      square_name = ChessBoard.square_name(coordinates)
      squares[square_name] = coordinates
    end
    squares
  end
end

def edges(vertex)
  column = vertex[0]
  row = vertex[1]

  [
    [column - 2, row + 1,],
    [column - 2, row - 1,],
    [column - 1, row + 2,],
    [column - 1, row - 2,],
    [column + 1, row + 2,],
    [column + 1, row - 2,],
    [column + 2, row + 1,],
    [column + 2, row - 1,],
  ]
end

def adjacent_vertices(vertex)
  vertices = ChessBoard.squares
  names_of_adjacent_vertices = vertices.select do |k, v|
    edges(vertex).include?(v)
  end.keys
end

def adjacency_list
  vertices = ChessBoard.squares
  adjacency_list = {}
  vertices.map { |k, v| adjacency_list[k] = adjacent_vertices(v) }
  adjacency_list
end

def update_queue_with(current_path)
  queue = []
  adjacent_vertices = adjacency_list[(current_path[:to])]
  
  if current_path[:from]
    adjacent_vertices.delete_if do |adjacent_vertex|
      adjacent_vertex == current_path[:from]
    end
  end
  adjacent_vertices.each do |adjacent_vertex|
    queue.push({from: current_path[:to],
                to: adjacent_vertex})
  end
  queue
end

def finished?(destination, queue, completed_paths)
  return false if completed_paths.empty?
  return true if queue.empty?
  
  completed_paths.any? { |completed_path| completed_path[:to] == destination }
end

def path_completed?(current_path, completed_paths)
  completed_paths.any? do |completed_path|
    completed_path[:to] == current_path[:to]
  end
end

def paths_to(destination, source)
  current_path = {from: nil, to: source}
  queue = update_queue_with(current_path)
  completed_paths = []
   until finished?(destination, queue, completed_paths)
    current_path = queue.shift
    unless path_completed?(current_path, completed_paths)
      queue += update_queue_with(current_path)
      completed_paths << current_path
    end
  end
  completed_paths
end

def shortest_path(destination, source)
  paths = paths_to(destination, source)
  shortest_path = []
  current_edge = paths.pop
  
  until paths.empty?
    target = current_edge[:from]
    next_edge = paths.pop
    next unless next_edge[:to] == target

    shortest_path << current_edge
    current_edge = next_edge
  end
  shortest_path << current_edge
  shortest_path.reverse
end

def path_cost(destination, source)
  shortest_path(destination, source).length.to_s
end

def display_path(destination, source)
  shortest_path = shortest_path(destination, source)
  vertices = shortest_path.shift.values

  until shortest_path.empty?
    vertices << shortest_path.shift.values.last
  end

  vertices.each(&:to_s).join(' -> ')
end

def display_result(destination, source)
  path = display_path(destination, source)
  cost = path_cost(destination, source)
  puts "You can get from #{source} to #{destination} in #{cost} moves!"
  puts path
end

display_result(:a1, :h8)