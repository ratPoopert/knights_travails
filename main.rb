# frozen_string_literal: true

require './lib/path_finder.rb'
require './lib/display.rb'

def display_result(destination, source)
  path = Display.path(destination, source)
  cost = PathFinder.path_cost(destination, source)
  puts "You can get from #{source} to #{destination} in #{cost} moves!"
  puts path
end

display_result(:a1, :c5)