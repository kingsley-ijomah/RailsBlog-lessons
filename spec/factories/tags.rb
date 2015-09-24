FactoryGirl.define do
  factory :tag do
    name Faker::Team.creature
		status [true, false].sample
  end
end
