require 'spec_helper'

describe Pet do
  before :each do
    @pet = FactoryGirl.create(:pet)
  end
  
  it 'validates the presence of the customer' do
    @pet.customer = nil
    lambda{
      @pet.save!   
    }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Customer can't be blank"
  end
  
  context 'name validation' do  
    it 'validates the presence of name' do
      @pet.name = nil
      lambda{
        @pet.save!   
      }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank"
    end
    
    it 'validates the length of name' do
      @pet.name = '0123456789012345678901234567890123456'
      lambda{
        @pet.save!   
      }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Name is too long (maximum is 35 characters)"
    end
  end
  
  context 'pet_type validation' do
    it 'allows :dog as pet_type' do
      @pet.pet_type = Pet::DOG
      @pet.save!
      @pet.reload
      @pet.pet_type.to_sym.should == Pet::DOG
    end
    
    it 'allows :cat as pet_type' do
      @pet.pet_type = Pet::CAT
      @pet.save!
      @pet.reload
      @pet.pet_type.to_sym.should == Pet::CAT
    end
    
    it 'allows :bird as pet_type' do
      @pet.pet_type = Pet::BIRD
      @pet.save!
      @pet.reload
      @pet.pet_type.to_sym.should == Pet::BIRD
    end
    
    it 'does not allow other value for pet_type' do
      @pet.pet_type = :other_value
      lambda{
        @pet.save!   
      }.should raise_error ActiveRecord::RecordInvalid, 'Validation failed: Pet type must be dog or cat or bird'
    end
  end
  
  it 'validates the presence of age' do
    @pet.age = nil
    lambda{
      @pet.save!   
    }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Age can't be blank"
  end
  
  it 'validates the presence of weight' do
    @pet.weight = nil
    lambda{
      @pet.save!   
    }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Weight can't be blank"
  end
  
  it 'validates the presence of last_visit' do
    @pet.last_visit = nil
    lambda{
      @pet.save!   
    }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Last visit can't be blank"
  end
  
  it 'creates new pet from a hash' do
    customer = FactoryGirl.create(:person, name: 'Thomass Closs')
    last_visit = 7.days.ago
    
    pet = Pet.create_from_hash({
      customer: customer,
      name: 'Wing Chun',
      pet_type: Pet::BIRD,
      breed: 'Eagle',
      age: 5,
      weight: 12.8,
      last_visit: last_visit
    })
    
    pet.reload
    pet.customer.should == customer
    pet.name.should == 'Wing Chun'
    pet.pet_type.to_sym.should == Pet::BIRD
    pet.breed.should == 'Eagle'
    pet.age.should == 5
    pet.weight.should == 12.8
    pet.last_visit.should == last_visit.to_date
  end
  
end