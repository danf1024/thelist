# Preview all emails at http://localhost:3000/rails/mailers/rsvp_mailer
class RsvpMailerPreview < ActionMailer::Preview
  def new_rsvp
    RsvpMailer.new_rsvp(Invitation.first)
  end
end
