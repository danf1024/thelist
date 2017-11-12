class Table < ApplicationRecord
  has_many :guests

  def full_name
    "(#{number}) - #{description}"
  end
end
