require_relative '../lib/bike_container'
require_relative '../lib/van'
require_relative '../lib/docking_station'
require_relative '../lib/bike'
require_relative '../lib/garage'

describe Garage do 

	let (:van) { Van.new }
	let (:garage) { Garage.new }

	it "collects broken bikes from van" do
		broken_bike = Bike.new
		broken_bike.break
		van.dock(broken_bike)

		garage.collect_broken_bikes_from(van)

		expect(garage.bikes).to include (broken_bike)
		expect(van).to be_empty
	end

	it "fixes broken bikes" do
		broken_bike = Bike.new
		broken_bike.break
		van.dock(broken_bike)

		garage.collect_broken_bikes_from(van)
		garage.fix_broken_bikes(broken_bike)

		expect(garage.available_bikes.count).to eq(1)
	end

	xit "delivers working bikes to van" do
		working_bike = Bike.new
		broken_bike = Bike.new
		broken_bike.break
		van.dock(broken_bike)
		garage.collect_broken_bikes_from(van)
		garage.fix_broken_bikes
		
		garage.deliver_available_bikes_to(van)

		expect(garage).to be_empty
		expect(van.bikes).to include (working_bike)
	end
end