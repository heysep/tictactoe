# This should have a method to get_guess which provides a value at 50
# then depending on if that number is higher or lower than the unknown number
# it will split again at half of that last guessed number in the correct direction

class SmartPlayer
	def initialize
		@guesses = (1..100).to_a
		@highest_index = @guesses.length-1
		@middle_index = @highest_index/2
	end

	def get_guess(too_high, first_round)
		if @guesses.length == 1
			@guesses[0]
		elsif first_round == false
			if too_high == true
				@guesses = @guesses.slice(0..(@middle_index-1))
			else
				@guesses = @guesses.slice((@middle_index+1)..-1)
			end
			@highest_index = @guesses.length-1
			@middle_index = @highest_index / 2
		end
		@guesses[@middle_index]
	end
end
