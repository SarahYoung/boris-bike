require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(options = {}) 
	# = means if you don't give a value for the argument options, use the value in the hash ({} is default value)
		self.capacity = options.fetch(:capacity, capacity) 
		# fetch gets value for that key out of hash or gets value from second argument (capacity)
	end

end	

# DockingStation.new # capacity == 10 <- this will use the default capacity
# DockingStation.new(:capacity => 50) # capacity = 50 <- will replace the default

# self.capacity=(options.fetch(:capacity, capacity)) 
# calling the method capacity= with the argument(options.fetch(:capacity, capacity))