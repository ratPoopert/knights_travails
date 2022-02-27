# frozen_string_literal: true

require './lib/chess_board.rb'

class Knight
  def self.valid_moves_from(square)
    file = square[0]
    rank = square[1]
    ChessBoard.squares.select do |square, coords|
      move_list(file, rank).include?(coords)
    end.keys
  end

  def self.move_list(file, rank)
     [[file - 2, rank + 1,],
      [file - 2, rank - 1,],
      [file - 1, rank + 2,],
      [file - 1, rank - 2,],
      [file + 1, rank + 2,],
      [file + 1, rank - 2,],
      [file + 2, rank + 1,],
      [file + 2, rank - 1,]]
  end

  def self.all_valid_moves
    adjacency_list = {}
    ChessBoard.squares.map do |square, coords|
      adjacency_list[square] = Knight.valid_moves_from(coords)
    end
    adjacency_list
  end
end
