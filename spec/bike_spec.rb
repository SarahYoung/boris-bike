require_relative "../lib/bike"

describe Bike do 
	let (:bike) { Bike.new }

	it "is not broken after created" do
		bike = Bike.new
		expect(bike).not_to be_broken
	end

	it "is be able to break" do
		bike.break
		expect(bike).to be_broken
	end

	it "is be able to get fixed" do
		bike.break
		bike.fix
		expect(bike).not_to be_broken
	end
end
