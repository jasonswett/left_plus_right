FactoryGirl.define do
  factory :role do
    name { generate(:random_string) }
  end
end
