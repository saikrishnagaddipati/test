class Address < ActiveRecord::Base
  belongs_to :person

  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence:true, format: { with: /(^\d{,5}$)/, message: 'must be at most 5 digits'}
end
