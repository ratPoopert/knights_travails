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
    @pieces = [Knight.new("k1")]
  end

  def to_s
    @display.render_board
  end

  def square(name)
    @squares.find { |square| square.name == name }
  end

  def piece(name)
    @pieces.find { |piece| piece.name = name }
  end

  def place_piece(piece_name, square_name)
    piece(piece_name).place_on square(square_name)
  end
end