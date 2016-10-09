require 'spec_helper'

describe Issue do
	it "has a valid factory" do
		expect(FactoryGirl.build(:issue)).to be_valid
	end	
end