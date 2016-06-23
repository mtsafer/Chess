require_relative "token"

class King < Token
	def next_moves board
		moves = [ [ x + 1, y ], [ x, y + 1 ], [ x, y - 1 ], [ x - 1, y ],
							[ x + 1, y + 1 ], [ x + 1, y - 1 ], [ x - 1, y + 1 ],
							[ x - 1, y - 1 ] ]
		moves.select { |move| board.on_board? move }
	end
end