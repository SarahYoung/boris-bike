require_relative '../lib/bike_container'
require_relative '../lib/van'
require_relative '../lib/docking_station'
require_relative '../lib/bike'
require_relative '../lib/garage'

describe Garage do 

	let (:van) { Van.new }
	let (:garage) { Garage.new }

	it "accepts broken bikes from van" do
		broken_bike = Bike.new
		broken_bike.break
		van.dock(broken_bike)

		garage.collect_broken_bikes_from(van)

		expect(garage.bikes).to include (broken_bike)
		expect(van).to be_empty
	end
end