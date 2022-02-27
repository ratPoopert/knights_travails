# frozen_string_literal: true

require './lib/path_finder.rb'

def path_cost(destination, source)
  PathFinder.shortest_path(destination, source).length.to_s
end

def display_path(destination, source)
  shortest_path = PathFinder.shortest_path(destination, source)
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

display_result(:a1, :c5)