require "pry"
WINNERS = [
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

def two_player?
	puts "Do you want two player game? y/n"
	reply = ""
	until reply == "y" || reply == "n"
		puts "Enter \"y\" or \"n\": "
		reply = gets.chomp.downcase
	end
	reply
end

def get_player(num)
	puts "What your name is playa?"
	name = gets.chomp.capitalize
	if num == 1
		puts "#{name}, you'll be \"X\"."
	else
		puts "#{name}, you'll be \"O\"."
	end
	name
end

def game_over?(board, mark)
	board_full?(board) || win?(board, mark)
end

def board_full?(board)
	board.all? { |i| i.is_a?(String) }
end

def win?(board, mark)
	combinations = already_picked(board, 3, mark)
	WINNERS.any?{ |win| combinations.include?(win) }
end

def prompt_player(board, player)
	puts "== It's #{player}'s turn now. =="
	puts "== Pick a place that's not taken =="
	pick = 10
	while board[pick].is_a?(String) || !(0..8).include?(pick)
		puts "Enter any of the available numbers: "
		pick = gets.chomp.to_i - 1
	end
	pick
end

def postmortem(board, mark, player)
	if win?(board, mark)
		puts "#{player} won."
	elsif board_full?(board)
		puts "
		It's a draw - nobody won.
		.Final Board.
		"
		show_board(board)
	end
end

def already_picked(board, combo_count, mark)
	player_picks = board.each_index.select{ |i| board[i] == mark }
	player_combos = player_picks.combination(combo_count).to_a
end


def cpu_pick(board, mark)
	# This is to start working on a more intelligent CPU algo:
	# already_picked = already_picked(board, 2, mark)
	# combo_2 = []
	# already_picked.each do |x| {combo_2.push(combination(2).to_a) }

	board.each_index.select{ |i| board[i].is_a?(Integer) }.sample
end

def tictactoe

	board = (1..9).to_a

	two_player = two_player?
	if two_player == "y"
		p1 = get_player(1)
		p2 = get_player(2)
	else
		p1 = get_player(1)
		p2 = "CPU"
		puts "#{p2} will be \"O\"."
	end

	player = p2
	mark = "O"

	until game_over?(board, mark)

		if player == p2
			player = p1 
			mark = "X"
		else 
			player = p2
			mark = "O"
		end
		show_board(board)
		if (player == p1) || (player == p2 && two_player == "y")
			pick = prompt_player(board, player)
		else
			pick = cpu_pick(board, mark)
		end
		
		board[pick] = mark
		postmortem(board, mark, player)
	end

end

tictactoe
