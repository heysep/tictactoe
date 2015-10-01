# This version uses a range instead of an array.

class SmartPlayer
	def initialize
		@min = 1
		@max = 100
	end

	def get_guess(result)
		if result == :first
			@guess = 50
		else
			if result == :low
				@min = @guess
			else
				@max = @guess
			end
		@guess = (@min + @max)/2
		end
	end
end