require_relative "token"

class Queen < Token
	def next_moves board
		moves = []
		for i in 0..7
			moves << [ x, i ]
			moves << [ i, y ] #castle moves
			moves << [ x + i, y + i ]
			moves << [ x + i, y - i ]
			moves << [ x - i, y + i ]
			moves << [ x - i, y - i ] #bishop moves
		end
		moves.select { |move| board.on_board? move }
	end
end