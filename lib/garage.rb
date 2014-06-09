require_relative 'bike_container.rb'

class Garage

	include BikeContainer

	def	collect_broken_bikes_from(van)
		van.broken_bikes.each do |bike|
			van.release(bike)
			self.dock(bike)
		end
	end

	def fix_broken_bikes(broken_bike)
		broken_bike.each {|bike| bike.fix}
	end

	def deliver_available_bikes_to(van)
		self.available_bikes.each do |bike|
			self.release(bike)
			van.dock(bike)
		end
	end
end