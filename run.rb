require_relative "lib/game"
require "yaml"

private
	
	#loads a saved game
	def load_game
		print "Load game (y/n): "
		load = gets.chomp.downcase[0]
		return false if load == 'n'
		return loader if load == 'y'
		load_game if (load != 'n' || load != 'y')
	end

	#Prompts the user for a file to load
	def loader_helper
		if !(Dir.exists? "saves") || Dir["saves/*"].length == 0
			puts "There are no save files...Starting game."
			return false
		end
		saves = Dir.entries("saves")
		saves.delete(".")
		saves.delete("..")
		puts "The save files are: #{saves.join(", ")}"
		print "Type the save name: "
		save = gets.chomp
		unless saves.include? save
			puts "That file doesn't exist. Try again.\n\n"
			save = loader_helper 
		end
		save
	end

	#returns the saved object, or false if there are no saves
	def loader
		save = loader_helper
		if save
			File.open("saves/#{save}", 'r'){ |f|
				return YAML.load(f)
			} 
		end
		false
	end

	def save_game game
		print "Name the save: "
		save_name = gets.chomp.downcase
		Dir.mkdir "saves" unless Dir.exists? "saves"
		file_path = File.join("saves", "#{save_name}")
		File.open(file_path, "w") { |f|
			f.write(YAML.dump(game))
		}
		puts "The game has been saved!"
	end

	def safe_input_from game
		print "#{game.active.name} (#{game.active.allegiance}) " +\
					 "select a piece to move (ex: b2): "
		input = gets.chomp.downcase
		if(input != "" && input[0].between?("a","h") && input[1].to_i.between?(1,8))
			input = input.split("")
			input[0] = input[0].ord - 97
			input[1] = input[1].to_i - 1
		elsif input == "save"
			save_game game
			input = safe_input_from game
		else
			puts "\ninvalid input\n\n"
			input = safe_input_from game
		end
		input
	end

	def safe_input_to game
		print "#{game.active.name} (#{game.active.allegiance}) " +\
					 "select a piece to move (ex: b2): "
		input = gets.chomp.downcase
		if(input != "" && input[0].between?("a","h") && input[1].to_i.between?(1,8))
			input = input.split("")
			input[0] = input[0].ord - 97
			input[1] = input[1].to_i - 1
		elsif input == "save"
			save_game game
			input = safe_input_to game
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
	#load a game
	load = load_game
	load ? game = load : game = Game.new
	puts "Type save at any point to save the game"
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
		if game.check game.active
			puts "You are in check!"
		end
	end

	puts "The winner was #{game.winner}!"