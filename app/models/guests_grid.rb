class GuestsGrid
  include Datagrid

  scope { Guest }

  filter(:name, :string) do |value|
    where("name ilike ?", "%#{value}%")
  end

  filter(:entree_selection, :enum, select: Guest.entree_options)

  filter(:accepted, :boolean) do |value|
    if value
      self.accepted
    else
      self
    end
  end

  filter(:declined, :boolean) do |value|
    if value
      self.declined
    else
      self
    end
  end

  filter(:outstanding, :boolean) do |value|
    if value
      self.outstanding
    else
      self
    end
  end

  column(:name) { self.name || '(guest)' }
  column(:entree_selection)
  column(:table) { self.table.number if self.table.present? }
  column(:accepted_at, order: false)
  column(:declined_at, order: false)
  column(:actions, html: true) do |record|
    link_to 'Edit', edit_guest_path(record)
  end
end
