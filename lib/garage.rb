require_relative 'bike_container.rb'

class Garage

	include BikeContainer

	def	collect_broken_bikes_from(van)
		van.broken_bikes.each {|bike|	van.release(bike); self.dock(bike)}
	end

	def fix_broken_bikes
		bikes.each {|bike| bike.fix}
	end

	def load_available_bikes_to(van)
		self.available_bikes.each {|bike| self.release(bike) ; van.dock(bike)}
	end

	def initialize(options = {})
		@capacity = 100 
		self.capacity = options.fetch(:capacity, capacity) 
	end
	
end