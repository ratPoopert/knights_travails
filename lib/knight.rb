# frozen_string_literal: true

class Knight
  attr_reader :name
  
  def initialize(name)
    @name = name
    @current_square = nil
    @occupied_squares = []
  end

  def to_s
    name
  end

  def place_on(square)
    @current_square = square
    @occupied_squares.push(@current_square)
    square.occupied_by(self)
  end

  # def moves
  #   x = @current_location[:row]
  #   y = @current_location[:column]
    
  #   possible_moves = 
  #   [
  #     [x + 2, y - 1],
  #     [x + 2, y + 1],
  #     [x + 1, y + 2],
  #     [x + 1, y - 2],
  #     [x - 2, y + 1],
  #     [x - 2, y - 1],
  #     [x - 1, y + 2],
  #     [x - 1, y - 2]
  #   ]
  # end
end