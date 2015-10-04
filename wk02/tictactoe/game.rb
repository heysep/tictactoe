#game

WIN_PATTERNS =[
	[0,1,2],[2,5,8],[6,7,8],[0,3,6],
	[1,4,7],[3,4,5],[0,4,8],[2,4,6]
	]

class Game
	attr_reader :player1, :player2, :board

	def initialize (player1, player2)
		@player1 = player1
		@player2 = player2
		@board = (1..9).to_a
		@player = @player1
	end

	def available_moves
		@board.reject{ |x| x.is_a?(String) }
	end

	def play
		@move
		until over?

			show_board
			get_move
			update_board
			switch_player

		end
		finito
	end

	private
		def get_move
			@move = @player.make_move
			until available_moves.include?(@move)
				puts "#{@move} isn't an available space. Try again: "
				@move = @player.make_move
			end
		end
		
		def finito
			puts "Game is over. Who won? "
			if win?
				switch_player
				puts "#{@player.mark} has won!"
			else
				puts "Nobody won. It's a draw."
			end
			show_board
		end

		def show_board
			puts "
				| #{@board[0]} | #{@board[1]} | #{@board[2]} |
				| #{@board[3]} | #{@board[4]} | #{@board[5]} |
				| #{@board[6]} | #{@board[7]} | #{@board[8]} |
			"
		end

		def switch_player
			@player = @player == @player1 ? @player2 : @player1
		end

		def update_board
			@board[@move-1] = @player.mark
		end

		def draw?
			available_moves.empty?
		end

		def win?
			WIN_PATTERNS.any? do |x, y, z|
				@board[x] == @board[y] && @board[y] == board[z]
			end
		end

		def over?
			win? || draw?
		end

end

