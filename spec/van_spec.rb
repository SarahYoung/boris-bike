require_relative '../lib/bike_container'
require_relative '../lib/van'
require_relative '../lib/docking_station'
require_relative '../lib/bike'
require_relative '../lib/garage'

describe Van do 

	let (:station) { DockingStation.new }
	let (:van) { Van.new }
	let (:garage) { Garage.new }


	it "collects broken bikes from the docking station" do

		broken_bike = Bike.new
		broken_bike.break		
		station.dock(broken_bike)

		van.collect_broken_bikes_from(station)

		expect(van.bikes).to include (broken_bike)
		expect(station).to be_empty

	end

	it "delivers broken bikes to the garage" do
		broken_bike = Bike.new
		broken_bike.break
		station.dock(broken_bike)
		van.collect_broken_bikes_from(station)

		van.deliver_broken_bikes_to(garage)

		expect(garage.bikes).to include (broken_bike)
		expect(van).to be_empty
	end

	it "delivers working bikes to the station" do

		working_bike = Bike.new
		van.dock(working_bike)

		van.deliver_working_bikes_to(station)

		expect(station.bikes).to include (working_bike)
		expect(van).to be_empty 

	end


end