def fizzbuzz(max)
	1.upto(max) do |n|
	  if n % 15 == 0
	    puts "FizzBuzz"
	  elsif n % 3 == 0 
	    puts "Fizz"
	  elsif n % 5 == 0
	    puts "Buzz"
	  else 
	    puts n
	  end
	end
end
puts "What's your max?\n"
fizzbuzz(gets.chomp.to_i)