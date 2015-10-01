# The program assigns a value from 0 (inclusive)
# to 101 (exclusive). Then the user must guess the number.

num = rand(101)

puts "Can you guess my number?\n(hint: it's less than 101)"
trys = 1

user_num = gets.chomp.to_i

if user_num == num
	puts "Holy shit, right on first try. Effin' genius!"
end

while user_num != num
	if user_num < num
		puts "Your num is less than mine, guess higher."
	else
		puts "Your num is greater than mine, guess lower."
	end
	trys += 1
	user_num = gets.chomp.to_i
end

puts "You guessed right dude. My number is #{num}.\nIt took you #{trys} try's to guess that."
