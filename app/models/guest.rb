class Guest < ActiveRecord::Base
  belongs_to :invitation

  validates :rsvp_code, uniqueness: true
  validates :category, presence: true
  validates :entree_selection, inclusion: { in: %w(salmon surf_n_turf duck veg) }, if: -> { accepted_at.present? }
end
