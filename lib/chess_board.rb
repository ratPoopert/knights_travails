# frozen_string_literal: true

require './lib/square.rb'

class ChessBoard
  def self.coordinates_list
    (1..8).to_a.repeated_permutation(2).to_a
  end

  def self.squares
    squares = {}
    coordinates_list.map do |coordinates|
      square_name = ChessBoardSquare.name(coordinates)
      squares[square_name] = coordinates
    end
    squares
  end
end