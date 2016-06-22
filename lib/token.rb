class Token
	attr_reader :x, :y, :history, :position
	def initialize( position, history = [] ) # position is [x,y]
		@x = position[0]
		@y = position[1]
		@position = position
		@history = history + [ position ]
	end
end