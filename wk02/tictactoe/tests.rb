require "minitest/autorun"
require "./human"
require "./game"
require "./computer"

class HumanPlayerTest < MiniTest::Test
	def setup
		@human1 = HumanPlayer.new("X")
	end

	def test_can_have_new_human_player_with_name_mark
		assert @human1.mark == "X"
	end
end

class ComputerPlayerTest < MiniTest::Test
	def setup
		@computer1 = ComputerPlayer.new("X")
	end

	def test_can_have_computer_player_with_name
		assert_equal(@computer1.mark, "X")
	end

	def test_computer_picks_random_move_1_to_9
		20.times { assert_includes((1..9), @computer1.make_move) }
	end
end

class GameTest < MiniTest::Test
	def setup
		@human1 = HumanPlayer.new("X")
		@computer1 = ComputerPlayer.new("O")
		@game = Game.new(@human1, @human2)
		@blank_board = (1..9).to_a
	end

	def test_game_starts_with_new_board
		assert @game.board.all?{ |x| x == @blank_board[x-1]}
	end

	def test_game_gets_move_from_player
		move = @human1.make_move
		assert_includes(@blank_board, move)
	end

	def test_can_play_game_with_2_humans
		assert @game.player1 == @human1
		assert @game.player2 == @human2
	end
end







