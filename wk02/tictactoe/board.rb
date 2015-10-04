#board

WIN_PATTERNS =[
	[0,1,2],[2,5,8],[6,7,8],[0,3,6],
	[1,4,7],[3,4,5],[0,4,8],[2,4,6]
	]


class Board
	attr_reader :board
	def initialize
		@board = (1..9).to_a
	end

	def display
		puts "
			| #{@board[0]} | #{@board[1]} | #{@board[2]} |
			| #{@board[3]} | #{@board[4]} | #{@board[5]} |
			| #{@board[6]} | #{@board[7]} | #{@board[8]} |
		"
	end

	def update(mark, move)
		@board[move-1] = mark
	end

	def available_moves
		@board.reject{ |x| x.is_a?(String) }
	end

	def draw?
		available_moves.empty?
	end

	def win?
		WIN_PATTERNS.any? do |x, y, z|
			@board[x] == @board[y] && @board[y] == @board[z]
		end
	end


end



# 3 x 3
# 1 2 3
# 4 5 6
# 7 8 9

# 4 x 4
# 1  2  3  4
# 5  6  7  8
# 9  10 11 12
# 13 14 15 16

# 5 x 5
# 1  2  3  4  5
# 6  7  8  9  10
# 11 12 13 14 15
# 16 17 18 19 20
# 21 22 23 24 25