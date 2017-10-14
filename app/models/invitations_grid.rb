class InvitationsGrid
  include Datagrid

  scope { Invitation.order(rsvp_code: :asc) }

  filter(:rsvp_code, :string, multiple: ',')

  filter(:addressee, :string) do |value|
    where("addressee ilike ?", "%#{value}%")
  end

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

  column(:rsvp_code)
  column(:addressee)
  column(:guest_count) { guests.count }
  column(:sent_at, order: false)
  column(:accepted_at, order: false)
  column(:declined_at, order: false)
  column(:actions, html: true) do |record|
    link_to 'View', invitation_path(record)
  end
end
