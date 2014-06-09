class Van
	include BikeContainer

	def	load_broken_bikes_from(station)
		station.broken_bikes.each do |bike|
			station.release(bike)
			self.dock(bike)
		end
	end
	
	# def collect_available_bikes_from(station)
	# 	station.available_bikes.each do |bike|
	# 		station.release(bike)
	# 		self.dock(bike)
	# 	end
	# end

end