# frozen_string_literal: true

class Square
  attr_reader :row, :column, :name
  attr_accessor :neighbors
  
  def initialize(name, column, row)
    @name = name
    @row = row
    @column = column
    @occupant = nil
    @neighbors = nil
  end

  def occupied_by(piece)
    @occupant = piece.name
  end

  def to_s
    name
  end

  def render
    @occupant ? @occupant.to_s : " "
  end
end