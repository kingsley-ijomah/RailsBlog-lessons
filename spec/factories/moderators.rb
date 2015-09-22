FactoryGirl.define do
  factory :moderator do
    fullname Faker::Name.name
		username Faker::Internet.email
		password Faker::Internet.password
  end
end
