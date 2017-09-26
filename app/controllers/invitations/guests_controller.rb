class Invitations::GuestsController < ApplicationController
  def new
    @invitation = Invitation.find params[:invitation_id]
  end

  def create
    @invitation = Invitation.find params[:invitation_id]
    guest = @invitation.guests.build create_params

    if guest.save
      redirect_to invitation_path(@invitation)
    else
      flash[:error] = 'Guest creation failed'
      render :new
    end
  end

  private

  def create_params
    params.fetch(:guest, {}).permit(:name)
  end
end
