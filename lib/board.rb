require_relative "player1"
require_relative "player2"

class Board

	#return true if the position is one the board, false otherwise
	def on_board? position #position should be [x,y]
		position.all? { |val| val.between?( 0, 7 ) }
	end

	def at_position position #position should be [x,y]

	end

end