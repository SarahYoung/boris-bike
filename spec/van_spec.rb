require_relative '../lib/bike_container'
require_relative '../lib/van'
require_relative '../lib/docking_station'
require_relative '../lib/bike'

describe Van do 

	let (:station) { DockingStation.new }
	let (:van) { Van.new }

	def bike_types
			@working_bike = Bike.new
			@broken_bike = Bike.new.break
	end

	it "only loads broken bikes from the docking station" do

		bike_types
		station.dock(@working_bike)
		station.dock(@broken_bike)
		van.load_broken_bikes_from(station)

		expect(van.bike).to eq([@broken_bike])
		expct(station.bike.count).to eq(1)

	end

	it "only unloads working bikes to the station" do 
		
		bike_types
		van.dock(@working_bike)
		van.unload_broken_bikes_to(station)

		expect(van.bike.count).to eq(0)
		expect(station.bike).to eq([@working_bike])

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