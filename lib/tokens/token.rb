class Token
	attr_reader :history, :position, :allegiance, :img, :enemy
	def initialize( position, history = [] ) # position is [x,y]
		@position = position
		@history = history + [ position ]
		@ally = "neutral"
		@enemy = "neutral"
		@allegiance = "neutral"
		@img = " "
	end

	def x
		position[0]
	end

	def y
		position[1]
	end

	#moves the token to the given spot if it is a legal move.
	#returns false if it an illegal move
	def move( move_to, board ) #the state of the board is passed
		moves = next_moves(board)
		if(	board.on_board?(move_to) ) #check that the move is on the board
		  if( moves.include?(move_to) ) #check that it's a real move
			  if( move_to != position ) #can't move to the same spot
					if( board.at_position(move_to).allegiance != @ally ) #can't move onto ally 
						if( !self.is_a?(Knight) && path_blocked?(move_to,board) ) #something in the way
							puts "There is something blocking the way!"
							return false
						else
							@position = move_to #set the new position
							return true
						end
					else
						puts "Friendly fire is not activated!"
						return false
					end
				else
					puts "You have to actually MOVE the piece"
					return false
				end
			else
				puts "That's not a valid move..."
				return false
			end
		else
			puts "You can't move off the board, yah cheater!"
			return false #return false if move_to can't resolve
		end
	end

	def flip
		@position = [((x-7)*-1),((y-7)*-1)]
	end

	def die
		@position = [-1,-1]
	end
	private 
		#returns true if the path is bocked
		#returns false if the way is clear
		def path_blocked?(to, board)
			if to[0] == x || to[1] == y
				check_straight(to, board)
			else
				check_diagonal(to, board)
			end
		end

		#checks the spots between the current location and the destination
		#using a straight path
		def check_straight(to, board)
			if to[0] == position[0] #same x coord, check y path
				((to[1] - y).abs - 1).times do |i| #do it distance times
					check = board.at_position([x, y + ((to[1]-y)/((to[1]-y).abs))*(i+1)])
					if check.allegiance != "neutral"
						return true
					end
				end
			else
				((to[0] - x).abs - 1).times do |i| #do it distance times
					check = board.at_position([x + ((to[0]-x)/((to[0]-x).abs))*(i+1), y])
					if check.allegiance != "neutral"
						return true
					end
				end
			end
			false
		end

		def check_diagonal(to, board)
			((to[0] - x).abs - 1).times do |i| #do it distance times
				check = board.at_position([x + ((to[0]-x)/((to[0]-x).abs))*(i+1), y + ((to[1]-y)/((to[1]-y).abs))*(i+1)])
				if check.allegiance != "neutral"
					return true
				end
			end
			false
		end
end