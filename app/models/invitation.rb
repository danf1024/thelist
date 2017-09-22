class Invitation < ActiveRecord::Base
  has_many :guests

  validates :rsvp_code, :addressee, :address_line_1, :city, :zip, presence: true

  def address_to_s
    lines = []
    lines << address_line_1
    lines << address_line_2 if address_line_2.present?
    city_state = []
    city_state << city
    city_state << state if state.present?
    city_state << country if country.present?
    last_line = [city_state.join(", "), zip].join(" ")
    lines << last_line
    lines.join("\n")
  end
end
