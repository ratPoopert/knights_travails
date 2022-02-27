# frozen_string_literal: true

require './lib/chess_board.rb'

class Knight
  def self.valid_moves_from(square)
    this_file = square.file
    this_rank = square.rank
    ChessBoard.squares.select do |square|
      coords = {file: square.file, rank: square.rank}
      move_list(this_file, this_rank).include?(coords)
    end.map(&:name)
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
    ChessBoard.squares.map do |square|
      adjacency_list[square.name] = Knight.valid_moves_from(square)
    end
    adjacency_list
  end
end
