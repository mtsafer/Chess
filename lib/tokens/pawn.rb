require_relative "token"

class Pawn < Token
	def initialize( position, history = [] )
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
		moves
	end

	def move( move_to, board )
		success = super
		success ? @first_turn = false : @first_turn = true
		success
	end

end
