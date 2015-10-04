#game

class Game
	attr_reader :player1, :player2, :board

	def initialize (player1, player2, board)
		@player1 = player1
		@player2 = player2
		@board = board
		@player = @player1
		@score = Score.new
	end

	def play
		until over?

			@board.display
			get_move
			@board.update(@player.mark, @move)
			switch_player

		end
		finito
	end

	private
		def get_move
			@move = @player.make_move
			until @board.available_moves.include?(@move)
				puts "#{@move} isn't an available space. Try again: "
				@move = @player.make_move
			end
		end
		
		def finito
			switch_player
			score_index = case @player.mark
				when "X" then 0
				when "O" then 1
				else 3
			end
			@score.update(score_index)
			puts "Game is over. Who won? "
			if @board.win?
				puts "#{@player.mark} has won!"
			else
				puts "Nobody won. It's a draw."
			end
			@board.display
			@score.display
		end

		def switch_player
			@player = @player == @player1 ? @player2 : @player1
		end

		def over?
			@board.win? || @board.draw?
		end

end

