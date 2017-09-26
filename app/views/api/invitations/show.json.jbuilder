json.(@invitation, :rsvp_code, :addressee, :accepted_at, :declined_at)
json.guests(@invitation.guests) do |guest|
    json.(guest, :id, :name, :entree_selection)
end
