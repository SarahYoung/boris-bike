require_relative '../lib/bike_container'
require_relative '../lib/van'
require_relative '../lib/docking_station'
require_relative '../lib/bike'
require_relative '../lib/garage'

describe Garage do 

	let (:van) { Van.new }
	let (:garage) { Garage.new }
	let (:broken_bike) { Bike.new }

	before do
		broken_bike.break
		van.dock(broken_bike)
		garage.collect_broken_bikes_from(van)
	end
	
	it "fixes broken bikes" do
		garage.fix_broken_bikes
		expect(garage.available_bikes.count).to eq(1)
	end

	context "On initialisation" do
		it "allows setting default capacity" do
			expect(garage.capacity).to eq(100)
		end	
	end
end