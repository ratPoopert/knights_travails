require './lib/board_builder.rb'

board = BoardBuilder.build_chess_board 
board.place_piece("k1", "a1")
p board.piece("k1").valid_moves
