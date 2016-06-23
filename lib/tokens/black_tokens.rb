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