module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		if @bikes.nil?
			@bikes = []
		end
		 @bikes 
	end

	def capacity
		if @capacity.nil?
			@capacity = DEFAULT_CAPACITY
		end
		@capacity
	end

	def capacity=(value) 
		@capacity = value
	end

	def bike_count
		bikes.count 
	end

	def dock(bike)
		raise "Station is full" if full? 
		bikes << bike 
	end

	def release(bike)
		bikes.delete(bike)
	end

	def full?
		bike_count() == @capacity
	end

	def empty?
		bike_count() == 0
	end

	def empty_holder(bike)
		raise "Station is empty" if empty?
	end

	def available_bikes
		bikes.reject {|bike| bike.broken? }
	end
end