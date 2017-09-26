class Guest < ApplicationRecord
  belongs_to :invitation

  validates :category, presence: true
  validates :entree_selection, inclusion: { in: %w(salmon surf_n_turf duck veg) }, if: -> { accepted_at.present? }

  def accept!(params)
    update!(accepted_at: Time.zone.now, declined_at: nil, name: params[:name], entree_selection: params[:entree_selection])
  end

  def decline!
    update!(declined_at: Time.zone.now, accepted_at: nil, entree_selection: nil)
  end

  def self.category_options
    {
      'FAMILY_D': :family_d,
      'FAMILY_S': :family_s,
      'FRIENDS_D': :friends_d,
      'FRIENDS_S': :friends_s,
      'WORK': :work
    }
  end
end
