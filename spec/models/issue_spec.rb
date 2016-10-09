require 'rails_helper'

describe Issue do
	it "has a valid factory" do
		expect(FactoryGirl.build(:issue)).to be_valid
	end	

	it { should validate_presence_of :title }
	it { should validate_presence_of :content }
	it { should validate_presence_of :user_id }

end