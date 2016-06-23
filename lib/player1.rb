require_relative "tokens/black_tokens"

class Player1
	attr_reader :tokens
	def initialize
		@pawns = []
		(0..7).each { |n| @pawns << BlackPawn.new([ n , 1 ]) }
		@knights = [ BlackKnight.new([ 1, 0 ]), BlackKnight.new([ 6, 0 ]) ]
		@tokens = [@pawns, @knights]
	end
end