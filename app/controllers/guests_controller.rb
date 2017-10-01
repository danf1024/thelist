class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def edit
    @guest = Guest.find params[:id]
  end

  def update
    @guest = Guest.find params[:id]

    if @guest.update update_params
      redirect_to invitation_path(@guest.invitation)
    else
      render :edit
    end
  end

  private

  def update_params
    params.fetch(:guest, {}).permit(:name)
  end
end
