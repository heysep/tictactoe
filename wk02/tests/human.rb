#human

class Human
	def initialize(name)
		@name = name
		@alertness = 0.094
		@has_coffee = false
		@needs_coffee = true
	end

	def alertness
		@alertness
	end

	def has_coffee?
		@has_coffee
	end

	def needs_coffee?
		@needs_coffee
	end

	def buy(coffee)
		@coffee = coffee
	end

	def drink!
		@alertness += 0.269
		@coffee.remove_liquid
	end

end