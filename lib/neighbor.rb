# frozen_string_literal: true

require './lib/square.rb'

class Neighbor
  attr_reader :direction, :name
  
  def initialize(direction, name)
    @direction = direction
    @name = name
  end

  def to_s
    @name
  end
end