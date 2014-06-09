class Van
	include BikeContainer

	def	collect_broken_bikes_from(station)
		station.broken_bikes.each do |bike|
			station.release(bike)
			self.dock(bike)
		end
	end

	def deliver_broken_bikes_to(garage)
		self.broken_bikes.each do |bike|
			self.release(bike)
			garage.dock(bike)
		end
	end

	def collect_working_bikes_from(garage)
		garage.available_bikes.each do |bike|
			garage.release(bike)
			self.dock(bike)
		end
	end

	def deliver_working_bikes_to(station)
		self.available_bikes.each do |bike|
			self.release(bike)
			station.dock(bike)
		end
	end

end