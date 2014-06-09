require_relative '../lib/bike_container'
require_relative '../lib/van'
require_relative '../lib/docking_station'
require_relative '../lib/bike'
require_relative '../lib/garage'

describe Van do 

	let (:station) { DockingStation.new }
	let (:van) { Van.new }
	let (:garage) { Garage.new }


	context 'Collecting and delivering broken bikes' do
		
		before do 
			broken_bike = Bike.new
			broken_bike.break
			station.dock(broken_bike)
		end

		xit "collects broken bikes from the docking station" do
			van.collect_broken_bikes_from(station)
			expect(van.bikes).to include (broken_bike)
			expect(station).to be_empty
		end

		xit "delivers broken bikes to the garage" do
			van.deliver_broken_bikes_to(garage)
			expect(garage.bikes).to include (broken_bike)
			expect(van).to be_empty
		end
	end

	context 'Collecting and delivering available bikes' do

		before do
			working_bike = Bike.new
		end

		xit "collects available bikes from the garage" do
			garage.dock(working_bike)
			van.collect_working_bikes_from(garage)
			expect(van.bikes).to include (working_bike)
			expect(garage).to be_empty
		end

		xit "delivers available bikes to the station" do
			van.dock(working_bike)
			van.deliver_working_bikes_to(station)
			expect(station.bikes).to include (working_bike)
			expect(van).to be_empty 
		end
	end

end