require_relative "token"

class Knight < Token

	#returns an array of knight objects at each of the 8 possible spots to go
	#note: this list does not exlude moves off the board
	def next_moves board
		moves = [ [ x + 2, y + 1 ], [ x + 2, y - 1 ], [ x + 1, y + 2 ],
						  [ x + 1, y - 2 ], [ x - 1, y + 2 ], [ x - 1, y - 2 ],
						  [ x - 2, y + 1 ], [ x - 2, y - 1 ] ]
		moves.select { |move| board.on_board? move }
	end
end