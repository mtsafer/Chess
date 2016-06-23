require_relative "../lib/game"

describe Game do
	let(:game) {Game.new}
	describe "#move" do
		context "player1 moves pawns, legally" do
			it "moves pawn forward two (first turn)" do
				game.move([4,1],[4,3],game.player1)
				expect(game.player1.tokens[0].any? do |pawn|
					pawn.position == [4,3] 
				end).to eql true
			end
			it "moves pawn forward one" do
				game.move([4,1],[4,2],game.player1)
				expect(game.player1.tokens[0].any? do |pawn|
					pawn.position == [4,2] 
				end).to eql true
			end
			it "can attack diagonally" do
				game.switch_turns
				game.move([4,1],[4,3],game.player2)
				game.move([4,3],[4,4],game.player2)
				game.move([4,4],[4,5],game.player2)
				game.switch_turns
				game.move([4,1],[3,2],game.player1)
				expect(game.player1.tokens[0].any? do |pawn|
					pawn.position == [3,2] 
				end).to eql true
			end
		end
		context "player1 can't move pawn illegaly" do
			it "can't move more then 1 forward after first turn" do
				game.move([4,1],[4,2],game.player1)
				game.move([4,2],[4,4],game.player1)
				expect(game.player1.tokens[0].any? do |pawn|
					pawn.position == [4,4] 
				end).to eql false
			end
			it "can't move into an ally" do
				game.switch_turns
				game.move([4,1],[4,3],game.player2)
				game.move([4,3],[4,4],game.player2)
				game.move([4,4],[4,5],game.player2)
				game.switch_turns
				game.move([4,1],[3,2],game.player1)
				game.move([3,1],[3,2],game.player1)
				expect(game.player1.tokens[0].any? do |pawn|
					pawn.position == [3,1] 
				end).to eql true
			end
			it "can't attack forward" do
				game.switch_turns
				game.move([4,1],[4,3],game.player2)
				game.move([4,3],[4,4],game.player2)
				game.move([4,4],[4,5],game.player2)
				game.switch_turns
				game.move([3,1],[3,2],game.player1)
				expect(game.player1.tokens[0].any? do |pawn|
					pawn.position == [3,1] 
				end).to eql true
			end
			it "can't jump over a piece" do
				game.switch_turns
				game.move([4,1],[4,3],game.player2)
				game.move([4,3],[4,4],game.player2)
				game.move([4,4],[4,5],game.player2)
				game.switch_turns
				game.move([3,1],[3,3],game.player1)
				expect(game.player1.tokens[0].any? do |pawn|
					pawn.position == [3,1] 
				end).to eql true
			end
			it "can't move 3 on first turn" do
				game.move([4,1],[4,4],game.player1)
				expect(game.player1.tokens[0].any? do |pawn|
					pawn.position == [4,4] 
				end).to eql false
			end
			it "can't move diagonally when no enemy is there" do
				game.move([4,1],[5,2],game.player1)
				expect(game.player1.tokens[0].any? do |pawn|
					pawn.position == [5,2] 
				end).to eql false
			end
		end
		context "moving non-existant piece" do
			it "puts 'There is no piece there!'" do
				expect{game.move([4,2],[4,3],game.player1)}.to \
				output("There is no piece there!\n").to_stdout
			end
			it "returns false" do
				expect(game.move([4,2],[4,3],game.player1)).to eql false
			end
		end
		context "jumping pieces" do
			it "can't move a castle over a piece" do
				game.move([0,0],[0,7],game.player1)
				expect(game.player1.tokens[2].any? do |castle|
					castle.position == [0,0] 
				end).to eql true
			end
			it "can't move a bishop over a piece" do
				game.move([2,0],[4,2],game.player1)
				expect(game.player1.tokens[3].any? do |bishop|
					bishop.position == [2,0] 
				end).to eql true
			end
			it "can't move a queen over a piece" do
				game.move([3,0],[5,2],game.player1)
				game.move([3,0],[1,2],game.player1)
				game.move([3,0],[3,5],game.player1)
				expect(game.player1.tokens[4].any? do |queen|
					queen.position == [3,0] 
				end).to eql true
			end
			it "CAN move a knight over a piece" do
				game.move([1,0],[2,2],game.player1)
				expect(game.player1.tokens[1].any? do |knight|
					knight.position == [2,2] 
				end).to eql true
			end
		end
		context "moving various pieces" do
			it "can move a bishop" do
				game.move([4,1],[4,3],game.player1)
				game.move([5,0],[2,3],game.player1)
				expect(game.player1.tokens[3].any? do |bishop|
					bishop.position == [2,3] 
				end).to eql true
			end
			it "can move a queen" do
				game.move([4,1],[4,3],game.player1)
				game.move([3,0],[6,3],game.player1)
				expect(game.player1.tokens[4].any? do |queen|
					queen.position == [6,3] 
				end).to eql true
			end
			it "can move a castle" do
				game.move([0,1],[0,3],game.player1) 
				game.move([0,0],[0,2],game.player1)
				game.move([0,2],[6,2],game.player1)
				expect(game.player1.tokens[2].any? do |castle|
					castle.position == [6,2] 
				end).to eql true
			end
			it "can't move a castle diagonally" do
				game.move([0,1],[0,3],game.player1) 
				game.move([0,0],[0,2],game.player1)
				game.move([0,2],[3,5],game.player1)
				expect(game.player1.tokens[2].any? do |castle|
					castle.position == [3,5] 
				end).to eql false
			end
		end
		context "attacking" do
			it "can attack an enemy" do
				game.move([4,1],[4,3],game.player1)
				game.move([3,0],[6,3],game.player1)
				game.move([6,3],[6,6],game.player1)
				expect(game.player2.tokens[0].any? do |pawn|
					pawn.position == [6,6] 
				end).to eql false
			end
			it "can't attack allies" do
				game.move([3,0],[3,1],game.player1)
				expect(game.player1.tokens[4].any? do |queen|
					queen.position == [3,0] 
				end).to eql true
			end
		end
	end
	describe "#switch_turns" do
		it "turns the board around" do
			game.switch_turns
			expect(game.player1.tokens[0].any? do |pawn|
				pawn.position == [4,6]
			end).to eql true
		end
	end
end