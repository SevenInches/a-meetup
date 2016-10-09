require 'faker'

FactoryGirl.define do
  factory :issue do
  	user_id 1
	title {Faker::Name.title }
	content {Faker::Name.title} 

  	factory :invalid_issue, :class => "Issue" do
  	 	user_id 1
	 	title nil
	end 	
  end
end