FactoryGirl.define do
  factory :comment do
    message Faker::Lorem.sentence
		fullname Faker::Name.name
		status 'f'
		post 
		visitor 
  end
end
