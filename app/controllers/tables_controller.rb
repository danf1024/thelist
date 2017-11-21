class TablesController < ApplicationController
  def index
    @tables = Table.order(:number)
  end

  def edit
    @table = Table.find params[:id]
  end

  def update
    @table = Table.find params[:id]

    if @table.update create_params
      redirect_to tables_path
    else
      render :edit
    end
  end

  def create
    @table = Table.new
    @table.assign_attributes create_params

    if @table.save
      redirect_to tables_path
    else
      render :new
    end
  end

  def destroy
    @table = Table.find params[:id]
    @table.destroy!
    redirect_to tables_path
  end

  private

  def create_params
    params.fetch(:table, {}).permit(:number, :description)
  end
end
