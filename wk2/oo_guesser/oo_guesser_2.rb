# This is a number guessing game.
require "pry"
# require "./human"
# require "./random"
# require "./counting"
require "./smart_2"

class GuessingGame
	def initialize(player)
		@player = player
	end

	def play
		count = 1
		result = :first
		num = rand(1..100)

		guess = @player.get_guess(result)
		last_guess = guess

		until guess == num
			
			puts "The number is #{num} and the guess is #{guess}."

			if (last_guess - num).abs < (guess - num).abs
				puts ":( Colder! But, WHY!"
			else
				puts "Warmer :) Oh, YEAH."
			end

			if guess > num
				result = :high
			else
				result = :low
			end
			last_guess = guess
			guess = @player.get_guess(result)
			count += 1
		end

		puts "The number was #{num} and you guessed #{guess}."
		puts "\nYou win! It took you >>:: #{count} ::<< tries."
		puts "\nGo'on have you a beer, boy, (or lady ;)"
			
	end
end

game = GuessingGame.new(SmartPlayer.new)
game.play