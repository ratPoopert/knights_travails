# frozen_string_literal: true

class ChessBoardSquare
  attr_reader :file, :rank, :name
  
  def initialize(file, rank)
    @file = file.freeze
    @rank = rank.freeze
    @name = ChessBoardSquare.name(@file, @rank)
  end

  def self.name(file, rank)
    file_name = ("a".."h").to_a[file - 1]
    rank_name = rank.to_s
    "#{file_name}#{rank_name}".to_sym
  end
end