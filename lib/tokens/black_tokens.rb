require_relative "knight"
require_relative "pawn"

class BlackKnight < Knight
	def initialize
		super
		@ally = "black"
		@enemy = "white"
		@allegiance = "black"
	end
end

class BlackPawn < Pawn
	def initialize
		super
		@ally = "black"
		@enemy = "white"
		@allegiance = "black"
	end
	def next_moves board #the state of the board is passed
		moves = [ [ x, y - 1 ] ]
		moves += [ [ x, y - 2 ] ] if @first_turn
		#add diagonal moves for pawn if there are enemies at those spots
		if board.at_position([ x + 1, y - 1 ]).allegiance == @enemy
			moves += [ [ x + 1, y - 1 ] ]
		end
		if board.at_position([ x - 1, y - 1 ]).allegiance == @enemy
			moves += [ [ x - 1, y - 1 ] ] 
		end
	end
end