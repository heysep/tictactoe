#human player file

class HumanPlayer
	attr_reader :mark

	def initialize(mark)
		@mark = mark
	end

	def make_move
		puts "It's #{mark}'s turn now."
		puts "Choose an available number: "
		gets.chomp.to_i
	end

end
