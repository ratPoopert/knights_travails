# frozen_string_literal: true

require './lib/chess_board.rb'
require './lib/path_finder.rb'

# Represents a knight chess piece.
class Knight
  def self.valid_moves_from(this_square)
    ChessBoard.squares.select do |that_square|
      coords = { file: that_square.file, rank: that_square.rank }
      move_list(this_square.file, this_square.rank).include?(coords)
    end.map(&:name)
  end

  def self.move_list(file, rank)
    [{ file: file - 2, rank: rank + 1  },
     { file: file - 2, rank: rank - 1  },
     { file: file - 1, rank: rank + 2  },
     { file: file - 1, rank: rank - 2  },
     { file: file + 1, rank: rank + 2  },
     { file: file + 1, rank: rank - 2  },
     { file: file + 2, rank: rank + 1  },
     { file: file + 2, rank: rank - 1  }]
  end

  def self.all_valid_moves
    adjacency_list = {}
    ChessBoard.squares.map do |square|
      adjacency_list[square.name] = Knight.valid_moves_from(square)
    end
    adjacency_list
  end

  def self.path(starting_square, ending_square)
    PathFinder.new(starting_square, ending_square, all_valid_moves)
  end
end
