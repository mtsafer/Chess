require_relative "board"
require_relative "player1"
require_relative "player2"

class Game
	def initialize
		@board = Board.new
		@player1 = Player1.new
		@player2 = Player2.new
		@empty = Token.new([-1,-1])
		update_board
	end

	def look
		@board.view
	end

	private

		def update_board
			@board.spots.each do |spot|
				spot[1] = @empty
			end
			@board.spots.map do |spot|
				@player1.tokens.each do |pieces|
					pieces.each do |piece| # should update board with token positions
						spot[1] = piece if spot[0] == piece.position
					end
				end
				@player2.tokens.each do |pieces|
					pieces.each do |piece| # should update board with token positions
						spot[1] = piece if spot[0] == piece.position
					end
				end
			end
		end
end