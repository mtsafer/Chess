require_relative "knight"
require_relative "pawn"
require_relative "castle"
require_relative "bishop"
require_relative "queen"
require_relative "king"

class WhiteKnight < Knight
	attr_reader :ally, :enemy, :allegiance, :img
	def initialize( position, history = [] )
		super
		@ally = "white"
		@enemy = "black"
		@allegiance = "white"
		@img = "\u265e"
	end
end

class WhitePawn < Pawn
	attr_reader :ally, :enemy, :allegiance, :img
	def initialize( position, history = [] )
		super
		@ally = "white"
		@enemy = "black"
		@allegiance = "white"
		@img = "\u265f"
	end
end

class WhiteCastle < Castle
	attr_reader :ally, :enemy, :allegiance, :img
	def initialize( position, history = [] )
		super
		@ally = "white"
		@enemy = "black"
		@allegiance = "white"
		@img = "\u265c"
	end
end

class WhiteBishop < Bishop
	attr_reader :ally, :enemy, :allegiance, :img
	def initialize( position, history = [] )
		super
		@ally = "white"
		@enemy = "black"
		@allegiance = "white"
		@img = "\u265d"
	end
end

class WhiteQueen < Queen
	attr_reader :ally, :enemy, :allegiance, :img
	def initialize( position, history = [] )
		super
		@ally = "white"
		@enemy = "black"
		@allegiance = "white"
		@img = "\u265b"
	end
end

class WhiteKing < King
	attr_reader :ally, :enemy, :allegiance, :img
	def initialize( position, history = [] )
		super
		@ally = "white"
		@enemy = "black"
		@allegiance = "white"
		@img = "\u265a"
	end
end