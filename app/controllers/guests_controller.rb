class GuestsController < ApplicationController
  def index
    @guests_grid = GuestsGrid.new(index_params) do |scope|
      scope.page(params[:page])
    end

    respond_to do |format|
      format.html
      format.csv { send_data @guests_grid.to_csv, filename: "guests-#{Date.today}.csv" }
    end
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

  def index_params
    params.fetch(:guests_grid, {}).permit(:name, :entree_selection, :accepted, :declined, :outstanding, :order, :ascending, :descending)
  end
end
