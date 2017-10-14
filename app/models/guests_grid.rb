class GuestsGrid
  include Datagrid

  scope { Guest }

  filter(:name)

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

  column(:name)
  column(:entree_selection)
  column(:accepted_at, order: false)
  column(:declined_at, order: false)
  column(:actions, html: true) do |record|
    link_to 'View', guest_path(record)
  end
end
