# This is a 2 player version by our instructor, Brit.

WINS = [
	[0,1,2],[2,5,8],[6,7,8],[0,3,6],
	[1,4,7],[3,4,5],[0,4,8],[2,4,6]
	]

def show_board(board)
	puts "
		| #{board[0]} | #{board[1]} | #{board[2]} |
		| #{board[3]} | #{board[4]} | #{board[5]} |
		| #{board[6]} | #{board[7]} | #{board[8]} |
	"
end

def choose_player
	puts "Would you like to play as 'X' or 'O'?"
	result = gets.chomp.upcase
	until ['X', 'O'].include?(result)
		puts "Sorry, you must choose 'X' or 'O', pick a letter."
		result = gets.chomp.upcase
	end
	result
end

def game_over?(board)
	win?(board) || draw?(board)
end

def win?(board)
	WINS.any? do |x, y, z|
		board[x] == board[y] && board[y] == board[z]
	end
end

def draw?(board)
	available_moves(board).empty?
end

def available_moves(board)
	board.reject{ |x| x.is_a?(String) }
end

def take_turn(board)
	show_board(board)
	puts "\nPlease choose a number on the board: "
	move = gets.chomp.to_i
	until available_moves(board).include?(move)
		puts "#{move} isn't an available space. Try again: "
		move = gets.chomp.to_i
	end
	move
end

def switch_player(player)
	player = player == "X" ? "O" : "X"
end

def finito(board, player)
	puts "Game is over. Who won? "
	if win?(board)
		puts "#{switch_player(player)} has won!"
	else
		puts "Nobody won. It's a draw."
	end
	show_board(board)
end

def tic_tac_toe 
	board = (1..9).to_a
	player = choose_player
	until game_over?(board)
		puts "\n== It's #{player}'s turn now. =="
		move = take_turn(board)
		board[move-1] = player
		player = switch_player(player)
	end
	finito(board, player)
end
tic_tac_toe