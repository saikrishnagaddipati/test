class Person < ActiveRecord::Base
  OWNER  = :owner
  DOCTOR = :doctor
  RECEPTIONIST = :receptionist
  CUSTOMER = :customer
  
  has_one :address
  has_many :pets # only for customer
  has_many :appointments # only for customer
  
  validates :address, presence: true
  validates :person_type, presence: true, format: { with: /(owner)|(doctor)|(receptionist)|(customer)/, message: 'invalid person_type.'}
  validates :name, presence:true, length: { maximum: 35 }
  validates :years_in_practice, numericality: { greater_than: 0, less_than_or_equal_to: 100 }, if: :is_doctor?
  
  delegate :street, :city, :state, :zip, to: :address
  
  def self.doctors
    Person.includes(:address).where('person_type = ? or person_type = ?', OWNER.to_s, DOCTOR.to_s )
  end
  
  def self.customers
    Person.includes(:address).where('person_type = ?', CUSTOMER.to_s)
  end
  
  def is_doctor?
    [OWNER, DOCTOR].include? self.person_type.to_s.to_sym
  end
  
  def customer_name
    name if person_type.to_sym == CUSTOMER
  end
  
end
