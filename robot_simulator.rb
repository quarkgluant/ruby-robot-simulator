require 'pry'

class Robot

	attr_reader :direction




	def orient(direction)
		if directions.include?(direction)
			@direction = direction
		else
			raise ArgumentError
		end
		
	end

	def directions
		[:north, :east, :south, :west]
	end

	def bearing
		return @direction
	end

	def turn_right



		


	 	if @direction == :west
	 		@direction = :north
	 	else
	 		@direction = directions[directions.index(@direction)+1]
	 	# 	@direction = :south
	 	# elsif @direction == :south
	 	# 	@direction = :west
	 	# elsif @direction == :west
	 	# 	@direction = :north
	 	end
	end

end