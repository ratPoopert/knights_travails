# frozen_string_literal: true

require './lib/chess_board.rb'

class Knight
  def self.valid_moves_from(square)
    file = square[:file]
    rank = square[:rank]
    ChessBoard.squares.select do |square, coords|
      move_list(file, rank).include?(coords)
    end.keys
  end

  def self.move_list(file, rank)
     [{file: file - 2, rank: rank + 1,},
      {file: file - 2, rank: rank - 1,},
      {file: file - 1, rank: rank + 2,},
      {file: file - 1, rank: rank - 2,},
      {file: file + 1, rank: rank + 2,},
      {file: file + 1, rank: rank - 2,},
      {file: file + 2, rank: rank + 1,},
      {file: file + 2, rank: rank - 1,}]
  end

  def self.all_valid_moves
    adjacency_list = {}
    ChessBoard.squares.map do |square, coords|
      adjacency_list[square] = Knight.valid_moves_from(coords)
    end
    adjacency_list
  end
end
