class BuildingsController < ApplicationController
  before_action :find_building, only:[:show, :update, :destroy, :edit]

  def index
    @buildings = Building.all
  end

  def show

  end

  def create
  end

  def destroy
  end

  def update
    if @building.update(building_params)
      redirect_to building_path(@building)
    else
      flash[:error]
      render 'edit'
    end

  end

  def edit
  end

  def new
  end

  private
  def find_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:name, :address)
  end
end
