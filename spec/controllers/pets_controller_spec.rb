require 'spec_helper'
describe PetsController do
  
  context 'display form to create new pet' do
    it 'loads list of pet types when display pet form' do
      get :new
      assigns(:pet_types).should == Pet.pet_types
    end
    
    it 'loads list of customers when display pet form' do
      customer = FactoryGirl.create(:person)
      get :new
      assigns(:customers).should == Person.customers
    end
  end
  
  context 'create new pet' do
    it 'creates pet successfully' do
      customer = FactoryGirl.create(:person)
      post :create, {customer: customer.id, name: 'Judo', pet_type: Pet::DOG, breed: 'Chihuahua', age: 3, weight: 12.5, last_visit: '2013/01/01' }
      
      pet = Pet.last
      pet.customer.should == customer
      pet.name.should == 'Judo'
      pet.pet_type.to_sym.should == Pet::DOG
      pet.breed.should == 'Chihuahua'
      pet.age.should == 3
      pet.weight.should == 12.5
      pet.last_visit.should == Date.parse('2013/01/01')
      assigns(:result).should == 'A pet with name Judo and id 1 created.'
    end
    
    it 'informs user if there is missing attribute' do
      customer = FactoryGirl.create(:person)
      post :create, {customer: customer.id, name: nil, pet_type: Pet::DOG, breed: nil, age: 3, weight: 12.5, last_visit: '2013/01/01' }
      
      assigns(:result).should == 'The following required attributes are missing: name,breed.'
    end
    
  end
  
end