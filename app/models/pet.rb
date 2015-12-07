class Pet < ActiveRecord::Base
  DOG = :dog
  CAT = :cat
  BIRD = :bird
  
  belongs_to :customer, class_name: 'Person', foreign_key: 'person_id'
  has_many :appointments
  
  validates :customer, presence: true
  validates :name, presence:true, length: { maximum: 35 }
  validates :pet_type, presence: true, format: { with: /(dog)|(cat)|(bird)/, message: 'must be dog or cat or bird'}
  validates :breed, presence: true, length: { maximum: 35 }
  validates :age, presence: true
  validates :weight, presence: true
  validates :last_visit, presence: true
  
  delegate :customer_name, to: :customer
  
  def self.pet_types
    [DOG, CAT, BIRD].map(&:capitalize)
  end
  
  def self.create_from_hash(data)
    pet = Pet.new
    data.each do |key, value|
      pet.send("#{key}=", value)
    end
    pet.save!
    pet
  end
  
end


