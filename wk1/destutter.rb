array = [2, 2, 3, 6, 5, 5, 5, 5, 2, 8, 8, 3, -2, -2]
def destutter_long_way array
	new_array = []
	i = 0
	length = array.length
	duplicate = false
	while i < length

		if duplicate == true
			new_array.pop
		end
		if array[i] == array[i+1]
			new_array.push(array[i+1])
			duplicate = true
		else
			new_array.push(array[i])
			duplicate = false
		end
		i+=1
	end
	new_array
end

def destutter_short_way array 
	result = []
	last_val = nil
	array.each do |i|
		current_val = i
		result.push(current_val) unless last_val == current_val
		last_val = current_val
	end
	result
end

puts "original: " + array.to_s + "\n"
puts "destuttered long way: " + (destutter_long_way array).to_s
puts "destuttered short way: " + (destutter_short_way array).to_s