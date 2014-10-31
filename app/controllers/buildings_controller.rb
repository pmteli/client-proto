class BuildingsController < ApplicationController
  respond_to :json

  def index
    #respond_with Building.where(:state => "Virginia")
    respond_with Building.all.select(:id, :building_id, :building_name, :gsf, :electricity_consumption, :peak_demand)
  end

  def show
    respond_with Building.find(params[:id])
  end

  def create
    respond_with Building.create(params[:id])
  end

  def update
    id = params[:id]
    building = Building.find(id)
    params.delete("id")
    building.update_attributes(building_params)
    respond_with building
  end

  def destroy
    respond_with Building.destroy(params[:id])
  end

  private

  def building_params
    params.require(:building).permit(:building_name, :building_id, :gsf, :electricity_consumption, :peak_demand)
  end

end
