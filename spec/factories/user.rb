FactoryGirl.define do
  factory :user do
    first_name { generate(:random_string) }
    last_name { generate(:random_string) }
    occupation { generate(:random_string) }
    role
  end
end
