require_relative "tokens/black_tokens"

class Player1
	def initialize
		@pawns = []
		(0..7).each { |n| pawns << BlackPawn.new([ n , 1 ]) }
		@knights = [ BlackKnight.new([ 1, 0 ]), BlackKnight.new([ 6, 0 ]) ]
	end
end