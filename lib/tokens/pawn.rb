require_relative "token"

class Pawn < Token
	def initialize
		super
		@first_turn = true
	end

	def next_moves board #the state of the board is passed
		moves = [ [ x, y + 1 ] ]
		moves += [ [ x, y + 2 ] ] if @first_turn
		#add diagonal moves for pawn if there are enemies at those spots
		if board.at_position([ x + 1, y + 1 ]).allegiance == @enemy
			moves += [ [ x + 1, y + 1 ] ]
		end
		if board.at_position([ x - 1, y + 1 ]).allegiance == @enemy
			moves += [ [ x - 1, y + 1 ] ] 
		end
	end

	#moves the token to the given spot if it is a legal move.
	#returns false if it an illegal move
	def move( move_to, board ) #the state of the board is passed
		super ? @first_turn = false : super #set first turn to false
	end

end
