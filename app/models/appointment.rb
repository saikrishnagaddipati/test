class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :customer, class_name: 'Person', foreign_key: 'person_id'
  
  validates :pet, presence: true
  validates :customer, presence: true
  validates :date_of_visit, presence: true
  validates :reason_for_visit, presence: true
  
  validate :date_of_visit_cannot_be_in_the_past
 
  def date_of_visit_cannot_be_in_the_past
    if !date_of_visit.blank? and date_of_visit < Date.today
      errors.add(:date_of_visit, "can't be in the past")
    end
  end
  
  def self.create_from_hash(data)
    appointment = Appointment.new
    data.each do |key, value|
      appointment.send("#{key}=", value)
    end
    appointment.save!
    appointment
  end
end