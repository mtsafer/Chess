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
end