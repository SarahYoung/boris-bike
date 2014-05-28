module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		if @bikes.nil?
			@bikes = []
		end
		 @bikes 
		# @bikes ||= []
	end

	def capacity
		if @capacity.nil?
			@capacity = DEFAULT_CAPACITY
		end
		@capacity
		# @capacity ||= DEFAULT_CAPACITY # 10
	end

	def capacity=(value) # argument that gets passed in from docking_station_spec
		@capacity = value
	end

	def bike_count
		bikes.count # counts the number of elements in the ln 7 array
	end

	def dock(bike)
		raise "Station is full" if full? # calls full? method (ln 38)
		bikes << bike # appends/adds 'bike' to @bike array ln 7
	end

	def release(bike)
		bikes.delete(bike) # removes the instance bike from the @bikes array (ln7)
	end

	def full?
		bike_count() == @capacity # calls bike_count method and comparies it to global variable @capacity
	end

	def empty?
		bike_count() == 0
	end

	# def empty_holder(bike)
	# 	raise "Station is empty" if empty?
	# end

	def available_bikes
		bikes.reject {|bike| bike.broken? } # create a new array with only the working biks
	end
end