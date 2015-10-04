#computer

class ComputerPlayer
	attr_reader :mark
	def initialize(mark)
		@mark = mark
	end

	def make_move
		rand(1..9)
	end

end
