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
	 	
	 	index = directions.index(@direction)
	 	index += 1
		directions[index]

	 	# if @direction == :north
	 	# 	@direction = :east
	 	# elsif @direction == :east
	 	# 	@direction = :south
	 	# elsif @direction == :south
	 	# 	@direction = :west
	 	# elsif @direction == :west
	 	# 	@direction = :north
	 	# end
	end

end