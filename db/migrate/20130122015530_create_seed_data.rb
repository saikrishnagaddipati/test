class CreateSeedData < ActiveRecord::Migration
  def up
    bob_address = create_address('1 Main Street', 'Centennial', 'CO', '80111')
    create_doctor('Bob Smiths', 'Harvard', 5, bob_address)
    
    susan_address = create_address('1 Broadway', 'Englewood', 'CO', '80112')
    create_doctor('Susan Clarks', 'Yale', 4, susan_address)
    
    john_address = create_address('105 Aparahoe road', 'Englewood', 'CO', '80112')
    customer_john = create_customer('John Gray', john_address)
    
    create_pet('Scott', Pet::DOG, 'Doberman', 5, 190.98, 7.days.ago, customer_john)
  end

  def down
  end
  
  def create_address(street, city, state, zip)
    address = Address.new
    address.street = street
    address.city = city
    address.state = state
    address.zip = zip
    address.save!
    address
  end
  
  def create_doctor(name, degree_from_school, years_in_practice, address)
    doctor = Person.new
    doctor.person_type = Person::DOCTOR
    doctor.name = name
    doctor.degree_from_school = degree_from_school
    doctor.years_in_practice = years_in_practice
    doctor.address = address
    doctor.save!
    doctor
  end
  
  def create_customer(name, address)
    customer = Person.new
    customer.person_type = Person::CUSTOMER
    customer.name = name
    customer.address = address
    customer.save!
    customer
  end
  
  def create_pet(name, pet_type, breed, age, weight, last_visit, customer)
    pet = Pet.new
    pet.name = name
    pet.pet_type = pet_type
    pet.breed = breed
    pet.age = age
    pet.weight = weight
    pet.last_visit = last_visit
    pet.customer = customer
    pet.save!
    pet
  end
  
end
