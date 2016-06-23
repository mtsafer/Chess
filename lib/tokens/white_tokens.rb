require_relative "knight"
require_relative "pawn"

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