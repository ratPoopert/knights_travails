# frozen_string_literal: true

require './lib/square.rb'

# Generates a list of chess board squares.
class ChessBoard
  def self.coordinates_list
    list = []
    (1..8).to_a.repeated_permutation(2).to_a.map do |coordinates|
      file, rank = coordinates
      list << { file: file, rank: rank }
    end
    list
  end

  def self.squares
    squares = []
    coordinates_list.map do |coords|
      squares << ChessBoardSquare.new(coords[:file], coords[:rank])
    end
    squares
  end
end
