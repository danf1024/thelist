class Api::RsvpsController < ApiController
  def create
    invitation = Invitation.find_by! rsvp_code: create_params[:rsvp_code]

    if accepted?
      invitation.accept! create_params[:comment], guest_params
    else
      invitation.decline! create_params[:comment]
    end

    RsvpMailer.new(invitation).deliver_later

    head :created
  end

  private

  def create_params
    params.permit(:rsvp_code, :accepted, :comment, guests: [:id, :name, :entree_selection])
  end

  def accepted?
    create_params[:accepted] == "true"
  end

  def guest_params
    result = []
    create_params[:guests].each { |_, params| result << params.to_h.symbolize_keys }
    result
  end
end
