require_relative "knight"
require_relative "pawn"

class BlackKnight < Knight
	attr_reader :ally, :enemy, :allegiance
	def initialize
		super
		@ally = "black"
		@enemy = "white"
		@allegiance = "black" #not strictly necessary but adds readability
	end
end

class BlackPawn < Pawn
	attr_reader :ally, :enemy, :allegiance
	def initialize
		super
		@ally = "black"
		@enemy = "white"
		@allegiance = "black" #not strictly necessary but adds readability
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