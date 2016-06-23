class Board

	attr_accessor :spots

	def initialize
		@no_token = Token.new([-1,-1])
		@spots = {}
		for i in 0..7
			for j in 0..7
				@spots[[i,j]] = @no_token
			end
		end
	end

	#return true if the position is one the board, false otherwise
	def on_board? position #position should be [x,y]
		position.all? { |val| val.between?( 0, 7 ) }
	end

	def at_position position #position should be [x,y]
		found = @no_token
		@spots.each { |spot, token| found = token if spot == position }
		found
	end

	def view
		spots.each do |spot, token|
			puts "" if spot[0] == 0
			print token.img
		end
	end

end