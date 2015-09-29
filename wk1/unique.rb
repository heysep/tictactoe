array = [2, 2, 3, "five", "five", "five", 5, 5, 5, 5, 2, 8, 8, 3, -2, -2]
def unique array 
	result = []
	last_val = nil
	array.each do |i|
		current_val = i
		if !result.include? current_val
			result.push(current_val) unless last_val == current_val
		end
		last_val = current_val
	end
	result
end

puts "original: " + array.to_s + "\n"
puts "unique: " + (unique array).to_s