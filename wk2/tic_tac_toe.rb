

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

def choose_mode
	puts "Do you want computer mode? y/n?"
	result = gets.chomp.downcase
	until ['y', 'n'].include?(result)
		puts "Enter 'y' for computer mode, 'n' for 2 player. "
		result = gets.chomp.downcase
	end
	return "cpu" if result == "y"
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

def get_possible_board(board, move, player)
	board.map { |position| position = position == move ? player : position }
end

def get_score(board, depth, player)
	if win?(board) && player == "O"
		return 10 - depth
	elsif win?(board) && player == "X"
		return depth - 10
	else
		return 0
	end
end

def minimax(board, depth, player)
	return get_score(board, depth, player) if game_over?(board)

	depth += 1
	scores = []
	moves = []

	# this keeps track of a scores and corresponding moves matched with index
	available_moves(board).each do |move| 
		possible_board = get_possible_board(board, move, player)
		scores.push minimax(possible_board, depth, player)
		moves.push move
	end

	if player == "X"
		max_score_index = scores.each_with_index.max[1]
		choice = moves[max_score_index]
		return choice
	else
		min_score_index = scores.each_with_index.min[1]
		choice = moves[min_score_index]
		return choice
	end
end


def tic_tac_toe 
	board = (1..9).to_a
	mode = choose_mode
	depth = 0

	if mode == "cpu"
		puts "You will play as 'X', \n Computer is 'O'."
		player = "O"
	else 
		player = choose_player
	end

	until game_over?(board)
		puts "\n== It's #{player}'s turn now. =="
		if mode == "cpu" && player == "O"
			move = minimax(board, depth, player)
		else
			move = take_turn(board)
		end

		board[move-1] = player
		player = switch_player(player)
	end

	finito(board, player)
end

tic_tac_toe













