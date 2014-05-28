require_relative '../lib/bike_container'
require_relative '../lib/van'
require_relative '../lib/docking_station'
require_relative '../lib/bike'

describe Van do 

	it "should collect available bikes from a station" do
		# 1. You prepare for the test
		station = DockingStation.new
		van = Van.new
		available_bike = Bike.new
		station.dock(available_bike)
		# 2. You perform the action (method) that you're testing
		van.collect_available_bikes_from(station)
		# 3. You check the results (expectations)
		expect(van.bikes).to include(available_bike)
		expect(station).to be_empty
		#
		# Step 1 is optional, 2 and 3 are not.
	end
end