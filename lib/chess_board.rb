# frozen_string_literal: true

class ChessBoard
  def self.coordinates_list
    (1..8).to_a.repeated_permutation(2).to_a
  end

  def self.square_name(coordinates)
    file_name_index = coordinates[0] - 1
    rank = coordinates[1]
    file_name = ("a".."h").to_a[file_name_index]
    rank_name = rank.to_s
    "#{file_name}#{rank_name}".to_sym
  end

  def self.squares
    squares = {}
    coordinates_list.map do |coordinates|
      square_name = ChessBoard.square_name(coordinates)
      squares[square_name] = coordinates
    end
    squares
  end
end