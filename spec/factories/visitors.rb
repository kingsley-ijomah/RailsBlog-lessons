FactoryGirl.define do
  factory :visitor do
    fullname Faker::Name.name
		email Faker::Internet.email
		status 'f'
  end
end
