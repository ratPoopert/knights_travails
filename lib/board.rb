# frozen_string_literal: true

require './lib/square.rb'
require './lib/display.rb'
require './lib/board_builder.rb'
require './lib/knight.rb'

class ChessBoard
  attr_reader :squares
  def initialize(squares)
    @squares = squares
    @display = Display.new(self)
    @pieces = [Knight.new("k1", self)]
  end

  def to_s
    @display.render_board
  end

  def square(name)
    @squares.find { |square| square.name == name }
  end

  def neighbor_of(name, direction)
    square = square(name)
    return nil if square.nil?

    neighbor = square.neighbor(direction)
    square(neighbor)
  end

  def piece(name)
    @pieces.find { |piece| piece.name == name }
  end

  def place_piece(piece_name, square_name)
    if piece(piece_name).current_square.nil?
      piece(piece_name).place_on square(square_name)
    else
      return nil unless piece(piece_name).valid_moves.include?(square_name)
    end
      
      piece(piece_name).place_on square(square_name)
  end

  def move(square_name, direction, number_of_squares)
    number_of_squares.times do
      square = neighbor_of(square_name, direction)
      return nil if square.nil?
    end
    square.name
  end
end