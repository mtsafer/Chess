require_relative "tokens/black_tokens"

class Player1
	attr_reader :tokens
	def initialize
		@pawns = []
		(0..7).each { |n| @pawns << BlackPawn.new([ n , 1 ]) }
		@knights = [ BlackKnight.new([ 1, 0 ]), BlackKnight.new([ 6, 0 ]) ]
		@castles = [ BlackCastle.new([ 0, 0 ]), BlackCastle.new([ 7, 0 ]) ]
		@bishops = [ BlackBishop.new([ 2, 0 ]), BlackBishop.new([ 5, 0 ]) ]
		@queens =  [  BlackQueen.new([ 3, 0 ]) ]
		@kings =   [   BlackKing.new([ 4, 0 ]) ]
		@tokens = [@pawns, @knights, @castles, @bishops, @queens, @kings]
	end
end