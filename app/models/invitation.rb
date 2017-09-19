class Invitation < ActiveRecord::Base
  has_many :guests

  validates :rsvp_code, :addressee, :address_line_1, :city, :zip, presence: true
end
