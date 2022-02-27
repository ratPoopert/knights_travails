# frozen_string_literal: true

class ChessBoardSquare
  def self.name(rank, file)
    file_name = ("a".."h").to_a[file - 1]
    rank_name = rank.to_s
    "#{file_name}#{rank_name}".to_sym
  end
end