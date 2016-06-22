class Knight
	attr_reader :x, :y, :history, :position
	def initialize( position, history = [] ) # position is [x,y]
		@x = position[0]
		@y = position[1]
		@position = position
		@history = history + [ position ]
	end

	#returns an array of knight objects at each of the 8 possible spots to go
	#note: this list does not exlude moves off the board
	def next_moves
		moves = [ [ @x + 2, @y + 1 ], [ @x + 2, @y - 1 ], [ @x + 1, @y + 2 ],
						  [ @x + 1, @y - 2 ], [ @x - 1, @y + 2 ], [ @x - 1, @y - 2 ],
						  [ @x - 2, @y + 1 ], [ @x - 2, @y -1 ] ]
	end
end