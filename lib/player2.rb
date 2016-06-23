require_relative "tokens/white_tokens"

class Player2
	attr_reader :tokens
	def initialize
		@pawns = []
		(0..7).each { |n| @pawns << WhitePawn.new([ n , 6 ]) }
		@knights = [ WhiteKnight.new([ 1, 7 ]), WhiteKnight.new([ 6, 7 ]) ]
		@castles = [ WhiteCastle.new([ 0, 7 ]), WhiteCastle.new([ 7, 7 ]) ]
		@bishops = [ WhiteBishop.new([ 2, 7 ]), WhiteBishop.new([ 5, 7 ]) ]
		@queens =  [  WhiteQueen.new([ 3, 7 ]) ]
		@kings =   [   BlackKing.new([ 4, 7 ]) ]
		@tokens = [@pawns, @knights, @castles, @bishops, @queens, @kings]
	end
end