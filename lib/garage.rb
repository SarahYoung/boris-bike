class Garage

	include BikeContainer

	def	collect_broken_bikes_from(van)
		van.broken_bikes.each do |bike|
			van.release(bike)
			self.dock(bike)
		end
	end

end