require 'factory_girl'

FactoryGirl.define do
  factory :person do
    association :address, factory: :address
    name 'Justin Ko'
    person_type Person::CUSTOMER
  end
end