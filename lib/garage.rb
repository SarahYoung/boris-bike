require_relative 'bike_container.rb'

class Garage

	include BikeContainer

	def	collect_broken_bikes_from(van)
		van.broken_bikes.each do |bike|
			van.release(bike)
			self.dock(bike)
		end
	end

	def fix_broken_bikes
		bikes.each {|bike| bike.fix}
	end

end