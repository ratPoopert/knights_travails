require './lib/board_builder.rb'

board = BoardBuilder.build_chess_board 
p board.square("a1").neighbors
board.squares.each {|square| puts "#{square.name}: #{square.neighbors.to_s}"}