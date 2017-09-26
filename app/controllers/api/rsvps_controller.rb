class Api::RsvpsController < ApiController
  def create
    invitation = Invitation.find_by! rsvp_code: create_params[:rsvp_code]

    if create_params[:accepted]
      invitation.accept! create_params[:guests]
    else
      invitation.decline!
    end

    head :created
  end

  private

  def create_params
    params.permit(:rsvp_code, :accepted, guests: [:id, :name, :entree_selection])
  end
end
