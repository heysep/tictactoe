# This is a number guessing game.
require "pry"
# require "./human"
# require "./random"
# require "./counting"
require "./smart"

class GuessingGame
	def initialize(player)
		@player = player
	end

	def play
		count = 1
		too_high = false
		first_round = true

		number = rand(1..100)

		guess = @player.get_guess(too_high, first_round)
		first_round = false
		
		until guess == number
			puts "The number is #{number} and the guess is #{guess}."
			if guess > number
				too_high = true
			else
				too_high = false
			end
			guess = @player.get_guess(too_high, first_round)
			count += 1
		end
		puts "The number was #{number} and you guessed #{guess}."
		puts "\nYou win! It took you >>:: #{count} ::<< tries."
		puts "\nGo'on have you a beer, boy, (or lady ;)"
			
	end
end

game = GuessingGame.new(SmartPlayer.new)
game.play