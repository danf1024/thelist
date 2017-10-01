class Guest < ApplicationRecord
  belongs_to :invitation

  validates :entree_selection, inclusion: { in: %w(salmon surf_n_turf duck veg) }, if: -> { accepted_at.present? }

  scope :accepted, -> { where.not(accepted_at: nil) }
  scope :declined, -> { where.not(declined_at: nil) }
  scope :outstanding, -> { where(accepted_at: nil, declined_at: nil) }

  def accept!(params)
    update!(accepted_at: Time.zone.now, declined_at: nil, name: params[:name], entree_selection: params[:entree_selection])
  end

  def decline!
    update!(declined_at: Time.zone.now, accepted_at: nil, entree_selection: nil)
  end
end
