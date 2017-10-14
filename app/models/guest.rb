class Guest < ApplicationRecord
  ENTREE_CHOICES = %w(salmon surf_n_turf duck veg).freeze
  ENTREE_NAMES = {
    salmon: 'Atlantic Salmon',
    surf_n_turf: 'Surf & Turf',
    duck: 'Roasted Duck',
    veg: 'Vegetarian'
  }

  belongs_to :invitation

  validates :entree_selection, inclusion: { in: ENTREE_CHOICES }, if: -> { accepted_at.present? }

  scope :accepted, -> { where.not(accepted_at: nil) }
  scope :declined, -> { where.not(declined_at: nil) }
  scope :outstanding, -> { where(accepted_at: nil, declined_at: nil) }

  self.per_page = 100

  def self.entree_options
    ENTREE_CHOICES.map do |value|
      [ENTREE_NAMES[value.to_sym], value]
    end.freeze
  end

  def accept!(params)
    update!(accepted_at: Time.zone.now, declined_at: nil, name: params[:name], entree_selection: params[:entree_selection])
  end

  def decline!
    update!(declined_at: Time.zone.now, accepted_at: nil, entree_selection: nil)
  end
end
