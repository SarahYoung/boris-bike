require_relative '../lib/bike_container'
require_relative '../lib/van'
require_relative '../lib/docking_station'
require_relative '../lib/bike'

describe Van do 

	let (:station) { DockingStation.new }
	let (:van) { Van.new }


	# def bike_types
	# 		@working_bike = Bike.new
	# 		@broken_bike = Bike.new.break
	# end

	it "collects broken bikes from the docking station" do

		broken_bike = Bike.new
		broken_bike.break		
		station.dock(broken_bike)

		van.collect_broken_bikes_from(station)

		expect(van.bikes).to include (broken_bike)
		expect(station).to be_empty

	end

	it "delivers working bikes to the station" do

		working_bike = Bike.new
		van.dock(working_bike)

		van.deliver_working_bikes_to(station)

		expect(station.bikes).to include (working_bike)
		expect(van).to be_empty 

	end

	xit "should collect available bikes from a station" do
		available_bike = Bike.new
		
		station.dock(available_bike)
		van.collect_available_bikes_from(station)
		expect(van.bikes).to include (available_bike)
		expect(station).to be_empty
	end

	xit "should collect broken bikes from the docking station" do

		station.dock(broken_bike)
		van.collect_broken_bikes_from(station)
		expect(van.bikes).to include (broken_bike)
		expect(station).to be_empty
	end
end