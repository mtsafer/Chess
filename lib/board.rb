require_relative "player1"
require_relative "player2"

class Board

	def initialize
		@no_token = Token.new(-1,-1)
	end

	#return true if the position is one the board, false otherwise
	def on_board? position #position should be [x,y]
		position.all? { |val| val.between?( 0, 7 ) }
	end

	def at_position position #position should be [x,y]
		found = @no_token
		player1.tokens.each do |token|
			token.each { |piece| found = piece if piece.position == position }
		end
		player2.tokens.each do |token|
			token.each { |piece| found = piece if piece.position == position }
		end
		found
	end

end