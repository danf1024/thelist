class Api::InvitationsController < ApiController
  def show
    @invitation = Invitation.find_by! rsvp_code: params[:rsvp_code]
  end
end
