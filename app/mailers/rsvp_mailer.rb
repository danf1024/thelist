class RsvpMailer < ApplicationMailer
  def new_rsvp(invitation)
    @invitation = invitation
    mail(subject: "New RSVP - #{@invitation.addressee}")
  end
end
