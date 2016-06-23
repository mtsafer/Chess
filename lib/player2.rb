require_relative "tokens/white_tokens"

class Player2
	attr_reader :tokens
	def initialize
		@pawns = []
		(0..7).each { |n| @pawns << WhitePawn.new([ n , 6 ]) }
		@knights = [ WhiteKnight.new([ 1, 7 ]), WhiteKnight.new([ 6, 7 ]) ]
		@tokens = [@pawns, @knights]
	end
end