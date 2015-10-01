require "pry"

class Cookie

	def eat
		puts "This is delicious."
	end

end

class Student
	def initialize(first_name, last_name)
		@name = "#{first_name} #{last_name}"
	end
	def name 
		@name
	end
	def does(a_thing)
		puts "#{@name} does #{a_thing}"
	end
end


binding.pry

puts "bluggh"