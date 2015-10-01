#coffee

class Coffee
	def initialize(coffee)
		@coffee = coffee
		@is_full = true
		@drink_count = 0
	end

	def full?
		@is_full
	end

	def remove_liquid
		if @is_full == true
			@is_full = false
		end
		@drink_count +=1
	end

	def empty?
		if @drink_count >= 3
			true
		else
			false
		end
	end

end