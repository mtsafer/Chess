class Token
	attr_reader :history, :position, :allegiance, :img
	def initialize( position, history = [] ) # position is [x,y]
		@position = position
		@history = history + [ position ]
		@ally = "white"
		@enemy = "black"
		@allegiance = "neutral"
		@img = "-"
	end

	def x
		position[0]
	end

	def y
		position[1]
	end

	def next_moves board
		#this method should always be overriden.
		#it is included here to satisfy the move method.
	end

	#moves the token to the given spot if it is a legal move.
	#returns false if it an illegal move
	def move( move_to, board ) #the state of the board is passed
		if( board.on_board?(move_to) && #check that the move is on the board
		  (next_moves(board).include?(move_to)) && #check that it's a real move
			(board.at_position(move_to).allegiance != @ally)) #can't move onto ally 
			@position = move_to #set the new position
		else
			false #return false if move_to can't resolve
		end
	end
end