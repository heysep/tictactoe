require "pry"
require "set"

MAX_TURNS = 10
WORD_LIST = ["chicken", "duck", "dog", "cat", "clown"]
ANSWER = WORD_LIST.sample

def greeting
	puts "Welcome to the game of Hangman!\n"
end

def game_over?(guesses)
	turns_left(guesses).zero? || win?(guesses) 
end

def show_progress(partial_word, guesses)
	turns_remaining = turns_left(guesses)
	puts "\nThe current word is: #{partial_word}"
	puts "You have #{turns_remaining} guesses left.\n"
end

def prompt_player(guesses, player)
	puts "It's #{player}'s turn now."
	puts "Please guess a letter: "
	guess = ""
	while guess != guess[/[a-z]/]
		puts "Make sure it's one letter a - z that you haven't used already."
		guess = gets.chomp.downcase
	end
	guess
end

def make_partial(guesses)
	ANSWER.chars.map do |letter|
		if guesses.include?(letter)
			".#{letter}"
		else
			"._"
		end
	end
end

def take_turn(guesses, player)
	partial_word = make_partial(guesses).join
	show_progress(partial_word, guesses)
	prompt_player(guesses, player)
end

def turns_left(guesses)
	answer_set = ANSWER.chars.to_set
	#wrong_guesses = guesses.difference(answer_set).count
	wrong_guesses = (guesses - answer_set).count
	MAX_TURNS - wrong_guesses
end

def win?(guesses)
	answer_set = ANSWER.chars.to_set
	#guesses.superset?(answer_set)
	guesses >= answer_set
end

def postmortem(guesses, player)
	if win?(guesses)
		puts "\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
		puts "O_O >>> Nice job! #{player} has won. <<< O_O"
		puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n\n"
	else
		puts "The word was #{ANSWER}. Better luck next time."
	end
end

def get_player
	puts "Enter first name: "
	gets.chomp
end

def hangman
	p1_guesses = Set.new
	p2_guesses = Set.new
	
	puts "=== Player 1 ==="
	player1 = get_player
	puts "=== Player 2 ==="
	player2 = get_player

	player = player1
	guesses = p1_guesses

	greeting

	until game_over?(guesses)
		guess = take_turn(guesses, player)
		guesses.add(guess)
		if !ANSWER.include?(guess)
			if player == player2
				player = player1
			else 
				player = player2
			end
			if guesses == p2_guesses
				guesses = p1_guesses
			else
				guesses = p2_guesses
			end
		end
	end

	postmortem(guesses, player)
end

def play?
	reply = ""
	puts "Do you want to play?"	
	until reply == "yes" || reply == "no" 
		puts "Type yes or no."
		reply = gets.chomp.downcase
	end
	puts "You so lame... You no game..." if reply == "no"
	reply
end

hangman
while play? == "yes"
	hangman
end
