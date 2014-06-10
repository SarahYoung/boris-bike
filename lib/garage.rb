require_relative 'bike_container.rb'

class Garage

	include BikeContainer

	def fix_broken_bikes
		bikes.each {|bike| bike.fix}
	end

	def initialize(options = {})
		@capacity = 100 
		self.capacity = options.fetch(:capacity, capacity) 
	end
	
end