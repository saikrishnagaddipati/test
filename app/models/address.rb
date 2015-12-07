class Address < ActiveRecord::Base
  belongs_to :person

  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true

  # Notice: The requirement says 'at most 5 digits, so the regexp match any thing from 1 digit to 5 digits
  validates :zip, presence:true, format: { with: /(^\d{,5}$)/, message: 'must be at most 5 digits'}

  # Ordinary U.S. zip validation /^[\d]{5}(-[\d]{4})?$/

end
