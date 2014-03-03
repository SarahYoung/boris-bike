# link to the Bike class
require_relative "../lib/bike"
# we're describing the functionality of a specific class, Bike
describe Bike do 
	# this is a specific feature (behaviour)
	# that we expect to be present
	it "should not be broken after we create it" do
		bike = Bike.new # initialise a new object of Bike class
		# expect an instance of this class to have 
		# a method "broken?" that should return false
		expect(bike).not_to be_broken
		# can also be written: expect(bike.broken?).to be_false
		# can also be written: bike.broken?.should be(false)
	end

	it "should be able to break" do
		bike = Bike.new
		bike.break
		expect(bike).to be_broken
	end
end