require 'factory_girl'

FactoryGirl.define do
  factory :pet do
    association :customer, factory: :person
    name 'Karate'
    pet_type Pet::DOG
    breed 'Doberman'
    age 3
    weight 25.5
    last_visit 15.days.ago
  end
end