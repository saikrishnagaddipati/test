require 'factory_girl'

FactoryGirl.define do
  factory :address do
    street '1 Main Street'
    city 'Centennial'
    state 'CO'
    zip '80112'
  end
end