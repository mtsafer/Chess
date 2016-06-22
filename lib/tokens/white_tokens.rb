require_relative "knight"
require_relative "pawn"

class BlackKnight < Knight
	attr_reader :ally, :enemy, :allegiance
	def initialize
		super
		@ally = "white"
		@enemy = "black"
		@allegiance = "white" #not strictly necessary but adds readability
	end
end

class BlackPawn < Pawn
	attr_reader :ally, :enemy, :allegiance
	def initialize
		super
		@ally = "white"
		@enemy = "black"
		@allegiance = "white" #not strictly necessary but adds readability
	end
end