require_relative "board"
require_relative "player1"
require_relative "player2"

class Game
	def initialize
		@board = Board.new
		@player1 = Player1.new
		@player2 = Player2.new
		update_board
	end

	def look
		puts @board.view
	end

	private

		def update_board
			@board.spots.each_key do |spot|
				@board.spots[spot] = Token.new([-1,-1])
			end
			@board.spots.each_key do |spot|
				@player1.tokens.each do |pieces|
					pieces.each do |piece| # should update board with token positions
						@board.spots[spot] = piece if spot = piece.position
					end
				end
			end
		end
end