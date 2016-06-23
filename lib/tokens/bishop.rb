require_relative "token"

class Bishop < Token

	def next_moves board
		moves = []
		for i in 0..7
			moves << [ x + i, y + i ]
			moves << [ x + i, y - i ]
			moves << [ x - i, y + i ]
			moves << [ x - i, y - i ]
		end
		moves
	end

end