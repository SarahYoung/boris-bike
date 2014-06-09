require_relative '../lib/docking_station'

describe DockingStation do
	
	let(:bike) { Bike.new }
	let(:station) { DockingStation.new(:capacity => 20) }

	def fill_station(station)
		20.times { station.dock(Bike.new) }
	end

	it "allows setting default capacity on initialising" do
		expect(station.capacity).to eq(20)
	end	

	it "accepts a bike" do
		bike = Bike.new
		station = DockingStation.new
		expect(station.bike_count).to eq(0)
		station.dock(bike)
		expect(station.bike_count).to eq(1)
	end

	it "releases a bike" do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end

	it "knows when it's full" do
		expect(station).not_to be_full
		20.times { station.dock(Bike.new) }
		expect(station).to be_full
	end

	it "does not accept a bike if it's full" do
		fill_station station 
		expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)
	end	

	it "provides the list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq([working_bike])
	end
end