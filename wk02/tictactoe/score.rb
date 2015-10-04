#scoreboard

class Score
	def initialize
			# X  O  Draws
	@score = [0, 0, 0]
	end

	def update(score_index)
		@score[score_index] +=1
	end

	def display
		puts "
			X # of Wins: #{@score[0]}
			O # of Wins: #{@score[1]}
			Total Draws: #{@score[2]}
		"
	end

end
