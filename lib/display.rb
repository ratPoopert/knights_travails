# frozen_string_literal: true

require './lib/path_finder.rb'

class Display
  def self.path(source, destination)
    shortest_path = PathFinder.shortest_path(destination, source)
    first_path = shortest_path.shift
    vertices = [first_path.source, first_path.destination]
  
    until shortest_path.empty?
      vertices << shortest_path.shift.destination
    end
  
    vertices.each(&:to_s).join(' -> ')
  end

  def self.result(source, destination)
    cost = PathFinder.path_cost(source, destination)
    puts "You can get from #{source} to #{destination} in #{cost} moves!"
    puts Display.path(source, destination)
  end
end