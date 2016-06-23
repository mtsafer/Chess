class Board

	attr_accessor :spots

	def initialize
		@no_token = Token.new([-1,-1])
		@spots = []
		for i in 0..7
			for j in 0..7
				@spots << [[j,i], @no_token]
			end
		end
	end

	#return true if the position is one the board, false otherwise
	def on_board? position #position should be [x,y]
		position.all? { |val| val.between?( 0, 7 ) }
	end

	def at_position position #position should be [x,y]
		found = @no_token
		@spots.each { |spot| found = spot[1] if spot[0] == position }
		found
	end

	def view
		spots.each do |spot|
			puts "" if spot[0][0] == 0
			print spot[1].img
		end
	end

end