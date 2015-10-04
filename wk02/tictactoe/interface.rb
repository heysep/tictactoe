require "pry"
require	"./human"
require "./computer"
require "./game"
require "./board"
require "./score"

def choose_mode
	puts "
		Choose your mode: 
			1. Human vs. Human
			2. Human vs. Computer
			3. Computer vs. Computer
		Enter 1, 2, or 3.
	"
	@mode = gets.chomp.to_i
	until (1..3).include?(@mode)
		puts "
		Choose your mode: 
			1. Human vs. Human
			2. Human vs. Computer
			3. Computer vs. Computer
		Enter 1, 2, or 3.
		"
		@mode = gets.chomp.to_i
	end
end

def set_players
	if @mode == 1
		@player1 = HumanPlayer.new("X")
		@player2 = HumanPlayer.new("O")
	elsif @mode == 2
		@player1 = HumanPlayer.new("X")
		@player2 = ComputerPlayer.new("O")
	elsif @mode == 3
		@player1 = ComputerPlayer.new("X")
		@player2 = ComputerPlayer.new("O")
	end
	puts "Player 1 is #{@player1.mark}. Player 2 is #{@player2.mark}."
end

def replay?
	replay = ""
	until replay == "no" || replay == "yes"
		puts "Would you like to play?"
		replay = gets.chomp
	end
	if replay == "yes"
		choose_mode
		set_players
		@board.reset!
		@game.play
		replay?
	else
		puts "Ending game... bye."
	end
end

choose_mode
set_players
@board = Board.new
@game = Game.new(@player1, @player2, @board)
@game.play
replay?






