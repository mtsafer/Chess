require_relative "token"

class Castle < Token

	def next_moves board
		moves = []
		for i in 0..7
			moves << [ x, i ]
			moves << [ i, y ]
		end
		moves.select { |move| board.on_board? move }
	end
end