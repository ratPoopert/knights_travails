# frozen_string_literal: true

require './lib/path_finder.rb'

class Display
  def self.path(destination, source)
    shortest_path = PathFinder.shortest_path(destination, source)
    vertices = shortest_path.shift.values
  
    until shortest_path.empty?
      vertices << shortest_path.shift.values.last
    end
  
    vertices.each(&:to_s).join(' -> ')
  end

  def self.result(destination, source)
    cost = PathFinder.path_cost(destination, source)
    puts "You can get from #{source} to #{destination} in #{cost} moves!"
    puts Display.path(destination, source)
  end
end