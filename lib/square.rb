# frozen_string_literal: true

class ChessBoardSquare
  def self.name(coordinates)
    file_name_index = coordinates[0] - 1
    rank = coordinates[1]
    file_name = ("a".."h").to_a[file_name_index]
    rank_name = rank.to_s
    "#{file_name}#{rank_name}".to_sym
  end
end