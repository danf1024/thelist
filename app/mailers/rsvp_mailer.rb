class RsvpMailer < ApplicationMailer
  def new_rsvp(invitation_id)
    @invitation = Invitation.find invitation_id
    mail(subject: "New RSVP - #{@invitation.addressee}")
  end
end
