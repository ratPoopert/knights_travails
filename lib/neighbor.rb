# frozen_string_literal: true

require './lib/square.rb'

class Neighbor
  def initialize(direction, name)
    @direction = direction
    @name = name
  end
end