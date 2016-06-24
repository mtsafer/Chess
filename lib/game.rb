require_relative "board"
require_relative "player1"
require_relative "player2"

class Game
	attr_reader :player1, :player2, :active
	def initialize
		@board = Board.new
		@player1 = Player1.new
		@player2 = Player2.new
		@active = @player1
		@empty = Token.new([-1,-1])
		update_board
	end

	def look
		@board.view
	end

	def move( from, to, player )
		token = @board.at_position(from)
		destination = @board.at_position(to)
		if token.allegiance != "neutral"
			if player.allegiance == token.allegiance
				if( token.is_a?(Pawn) && #trying to attack forward with a pawn
						to[0] == token.position[0] &&
						destination.enemy == player.allegiance)
					puts "Pawns can't attack forward"
					return false
				elsif destination.allegiance != player.allegiance
					success = token.move( to, @board, self )
					destination.die if success
					update_board
					return success
				else
					puts "you can't move onto your own piece, stupid!"
					return false
				end
			else
				puts "you don't have permission!"
				return false
			end
		else
			puts "There is no piece there!"
			return false
		end
	end

	def switch_turns
		flip_board
		update_board
		if @active.name == "Player1"
			@active = @player2
		else
			@active = @player1
		end
		@active
	end

	#returns the winner, if any. returns false otherwise
	def winner
		victor = false
		victor = "Player1" unless @board.on_board? player2.tokens[-1][0].position
		victor = "Player2" unless @board.on_board? player1.tokens[-1][0].position
		victor
	end

	#returns true if player is in check, false otherwise
	def check player
		in_check = false
		enemy = player.name == "Player1" ? player2 : player1
		enemy.tokens.each do |token|
			token.each do |piece|
				if( piece.next_moves(@board).include?(player.tokens[-1][0].position) &&
					!piece.path_blocked?(player.tokens[-1][0].position, @board))
					in_check = true
				end
			end
		end
		in_check
	end

	#update the board so that the board has matching locations
	#with the tokens
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

	private
		#each piece should have both coordinates subjected to the following formula
		#(n-7)(-1). This should effectively flip the board around
		def flip_board
			@player1.tokens.each do |pieces|
				pieces.each do |piece|
					piece.flip #should mirror the piece on board
				end
			end
			@player2.tokens.each do |pieces|
				pieces.each do |piece|
					piece.flip #should mirror the piece on board
				end
			end
		end
end