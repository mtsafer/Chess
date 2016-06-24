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

	#displays the current board state
	def view
		count = 0
		dark = "\u2591"
		light = "\u2593"
		shade_line_2 = "   " + (dark*6 + light*6)*4
		shade_line_1 = "   " + (light*6 + dark*6)*4
		base_letters = "     a     b     c     d     e     f     g     h\n\n"
		(0...@spots.length/8).reverse_each do |i|
			puts count % 2 == 0 ? shade_line_1 : shade_line_2
			print (i+1).to_s + "  "
			line = @spots[i*8...(i+1)*8]
			line.each do |spot|
				print count % 2 == 0 ? light*2 : dark*2
				if spot[1].img == " "
					print count % 2 == 0 ? light*2 : dark*2
				else
					print spot[1].img + " "
				end
				print count % 2 == 0 ? light*2 : dark*2
				count += 1
			end
			puts ""
			puts count % 2 == 0 ? shade_line_1 : shade_line_2
			count += 1
		end
		puts "\n" + base_letters
	end

end