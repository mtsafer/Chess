require_relative "lib/game"

private
	
	def safe_input_from game
		print "#{game.active.name} select a piece to move (ex: b2): "
		input = gets.chomp.downcase
		if(input[0].between?("a","h") && input[1].to_i.between?(1,8))
			input = input.split("")
			input[0] = input[0].ord - 97
			input[1] = input[1].to_i - 1
		else
			puts "\ninvalid input\n\n"
			input = safe_input_from game
		end
		input
	end

	def safe_input_to game
		print "#{game.active.name} select a spot to move to (ex: b4): "
		input = gets.chomp.downcase
		if(input[0].between?("a","h") && input[1].to_i.between?(1,8))
			input = input.split("")
			input[0] = input[0].ord - 97
			input[1] = input[1].to_i - 1
		else
			puts "\ninvalid input\n\n"
			input = safe_input_to game
		end
		input
	end

	def safe_input game
		move = []
		move << safe_input_from(game)
		move << safe_input_to(game)
		move
	end

	game = Game.new
	game.look
	#play the game
	until game.winner
		input = safe_input game #returns an array [from, to]
		success = game.move(input[0],input[1],game.active)
		if success
			game.switch_turns
			game.look #need to add check/checkmate to this method
		else
			puts "\nTry again!\n\n"
		end
	end