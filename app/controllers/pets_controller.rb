class PetsController < ApplicationController
  def new
    @pet_types = Pet.pet_types
    @customers = Person.customers
  end

  def create
    validate_presence(params)
    pet = Pet.create_from_hash({
      customer: Person.find(params[:customer].to_i),
      name: params[:name],
      pet_type: params[:pet_type].to_sym,
      breed: params[:breed],
      age: params[:age].to_i,
      weight: params[:weight].to_f,
      last_visit: Date.parse(params[:last_visit])
    })
    
    @result = "A pet with name #{pet.name} and id #{pet.id} created."
  rescue => error
    logger.error("#{error.message}\n#{error.backtrace.join("\n")}")
    @result = error.message
  end
  
  def validate_presence(params)
    required_attributes = [:customer, :name, :pet_type, :breed, :age, :weight, :last_visit]
    missing_attributes = params.select { |key,value| required_attributes.include?(key.to_sym) && value.blank?}.keys
    raise "The following required attributes are missing: #{missing_attributes.join(',')}." if !missing_attributes.empty?
  end
end
