# frozen_string_literal: true

require './lib/board.rb'
require './lib/square.rb'
require './lib/neighbor.rb'

class BoardBuilder
  def self.build_chess_board
    squares = make_squares
    all_neighbors(squares)
    ChessBoard.new(squares)
  end

  def self.make_squares
    squares = []
    (1..8).to_a.repeated_permutation(2).to_a.each do |coord|
      x, y = coord
      row = y.to_s
      column = ("a".."h").to_a[x - 1]
      name = "#{column}#{row}"
      squares << Square.new(name, x, y)
    end
    squares
  end

  def self.all_neighbors(squares)
    squares.each { |square| neighbors(square, squares)}
  end

  def self.neighbors(square, squares)
    neighbors = []
    
    adjacent_coordinates(square).map do |direction, location|
      neighbor = find_neighbor(squares, location)
      neighbors.push(Neighbor.new(direction.to_s, neighbor.name))
    end
    square.neighbors = neighbors
  end

  def self.find_neighbor(squares, location)
    squares.find do |this_square|
      this_square.column == location[:column] &&
      this_square.row == location[:row]
    end
  end

  def self.adjacent_coordinates(square)
    this_column, this_row = square.column, square.row
    {
      nw: {column: this_column - 1, row: this_row + 1},
      n: {column: this_column, row: this_row + 1},
      ne: {column: this_column + 1, row: this_row + 1},
      e: {column: this_column + 1, row: this_row},
      se: {column: this_column + 1, row: this_row - 1},
      s: {column: this_column, row: this_row - 1},
      sw: {column: this_column - 1, row: this_row - 1},
      w: {column: this_column - 1, row: this_row}
    }.select { |_direction, coords| valid_coords?(coords) }
  end

  def self.valid_coords?(coords)
    (1..8).include?(coords[:column]) &&
    (1..8).include?(coords[:row])
  end
end