FactoryGirl.define do
  factory :message do
    content Faker::Lorem.sentence
		visitor
  end
end
