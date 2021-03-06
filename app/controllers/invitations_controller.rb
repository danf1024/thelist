class InvitationsController < ApplicationController
  def index
    @invitations_grid = InvitationsGrid.new(index_params) do |scope|
      scope.page(params[:page])
    end
  end

  def show
    @invitation = Invitation.find params[:id]
  end

  def create
    @invitation = Invitation.new
    @invitation.assign_attributes create_params

    if @invitation.save
      redirect_to invitations_path
    else
      render :new
    end
  end

  private

  def create_params
    params.fetch(:invitation, {}).permit(:addressee, :address_line_1, :address_line_2, :city, :state, :zip, :country)
  end

  def index_params
    params.fetch(:invitations_grid, {}).permit(:rsvp_code, :addressee, :accepted, :declined, :outstanding, :descending, :ascending, :order)
  end
end
