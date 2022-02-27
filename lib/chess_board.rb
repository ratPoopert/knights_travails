# frozen_string_literal: true

require './lib/square.rb'

class ChessBoard
  def self.coordinates_list
    list = []
    (1..8).to_a.repeated_permutation(2).to_a.map do |coordinates|
      file, rank = coordinates
      list << {file: file, rank: rank}
    end
    list
  end

  def self.squares
    squares = {}
    coordinates_list.map do |coordinates|
      file = coordinates[:file]
      rank = coordinates[:rank]
      square_name = ChessBoardSquare.name(file, rank)
      squares[square_name] = coordinates
    end
    squares
  end
end