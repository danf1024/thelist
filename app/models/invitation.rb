class Invitation < ApplicationRecord
  has_many :guests

  validates :rsvp_code, :addressee, :address_line_1, :city, :zip, presence: true
  validates :rsvp_code, uniqueness: true

  before_validation :set_rsvp_code, if: -> { rsvp_code.nil? }

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

  private

  def set_rsvp_code
    existing_codes = self.class.pluck(:rsvp_code)
    self.rsvp_code = generate_rsvp_code

    while existing_codes.include? rsvp_code
      self.rsvp_code = generate_rsvp_code
    end
  end

  def generate_rsvp_code
    (0..1).map { code_letters[rand(code_letters.length)] }.concat([rand(2..9)]).join
  end

  def code_letters
    ('a'..'z').reject { |x| x == 'o' }
  end
end
