FactoryGirl.define do
  factory :post do
    title Faker::Name.title
		content Faker::Lorem.sentence
		publish true
		association :moderator, factory: :moderator
	end
end