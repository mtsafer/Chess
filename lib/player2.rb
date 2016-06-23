require_relative "tokens/white_tokens"

class Player2
	attr_reader :tokens
	def initialize
		@pawns = []
		(0..7).each { |n| pawns << WhitePawn.new([ n , 1 ]) }
		@knights = [ WhiteKnight.new([ 1, 0 ]), WhiteKnight.new([ 6, 0 ]) ]
		@tokens = [@pawns, @knights]
	end
end