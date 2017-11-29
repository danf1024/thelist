class Table < ApplicationRecord
  has_many :guests

  def full_name
    "(#{number}) - #{description}"
  end

  Guest::ENTREE_CHOICES.each do |entree|
    define_method "count_#{entree}" do
      guests.where(entree_selection: entree).count
    end
  end

  def entree_counts_display
    s = ""
    Guest::ENTREE_NAMES.each do |entree, display_name|
      count = send(:"count_#{entree}")
      s += "#{count} #{display_name} "
    end
    s.strip
  end
end
