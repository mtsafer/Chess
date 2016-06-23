require_relative "knight"
require_relative "pawn"
require_relative "castle"
require_relative "bishop"
require_relative "queen"
require_relative "king"

class BlackKnight < Knight
	attr_reader :ally, :enemy, :allegiance, :img
	def initialize( position, history = [] )
		super
		@ally = "black"
		@enemy = "white"
		@allegiance = "black"
		@img = "\u2658"
	end
end

class BlackPawn < Pawn
	attr_reader :ally, :enemy, :allegiance, :img
	def initialize( position, history = [] )
		super
		@ally = "black"
		@enemy = "white"
		@allegiance = "black"
		@img = "\u2659"
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

class BlackCastle < Castle
	attr_reader :ally, :enemy, :allegiance, :img
	def initialize( position, history = [] )
		super
		@ally = "black"
		@enemy = "white"
		@allegiance = "black"
		@img = "\u2656"
	end
end

class BlackBishop < Bishop
	attr_reader :ally, :enemy, :allegiance, :img
	def initialize( position, history = [] )
		super
		@ally = "black"
		@enemy = "white"
		@allegiance = "black"
		@img = "\u2657"
	end
end

class BlackQueen < Queen
	attr_reader :ally, :enemy, :allegiance, :img
	def initialize( position, history = [] )
		super
		@ally = "black"
		@enemy = "white"
		@allegiance = "black"
		@img = "\u2655"
	end
end

class BlackKing < King
	attr_reader :ally, :enemy, :allegiance, :img
	def initialize( position, history = [] )
		super
		@ally = "black"
		@enemy = "white"
		@allegiance = "black"
		@img = "\u2654"
	end
end