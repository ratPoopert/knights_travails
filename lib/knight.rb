# frozen_string_literal: true

class Knight
  attr_reader :name, :current_square
  
  def initialize(name, board)
    @name = name
    @board = board
    @current_square = nil
    @occupied_squares = []
  end

  def to_s
    name
  end

  def place_on(square)
    @current_square = square
    @occupied_squares.push(@current_square)
    square.occupied_by(self)
  end

  def moves
    [
      [{direction: "n", number: 1}, {direction: "e", number: 2}],
      [{direction: "n", number: 1}, {direction: "w", number: 2}],
      [{direction: "e", number: 1}, {direction: "n", number: 2}],
      [{direction: "e", number: 1}, {direction: "s", number: 2}],
      [{direction: "s", number: 1}, {direction: "w", number: 2}],
      [{direction: "s", number: 1}, {direction: "e", number: 2}],
      [{direction: "e", number: 1}, {direction: "s", number: 2}],
      [{direction: "e", number: 1}, {direction: "n", number: 2}],
    ]
  end

  def valid_moves
    return nil if @current_square.nil?
    
    valid_moves = moves.map do |sequence|
      square = move(sequence.first[:direction], sequence.first[:number])
      square = move(sequence.last[:direction], sequence.last[:number], square)
    end
  valid_moves
  end

  def move(direction, number, name = @current_square.name)
    @board.move(name, direction, number)
  end

  # def moves
  #   x = @current_location[:row]
  #   y = @current_location[:column]
    
  #   possible_moves = 
  #   [
  #     [x + 2, y - 1],
  #     [x + 2, y + 1],
  #     [x + 1, y + 2],
  #     [x + 1, y - 2],
  #     [x - 2, y + 1],
  #     [x - 2, y - 1],
  #     [x - 1, y + 2],
  #     [x - 1, y - 2]
  #   ]
  # end
end