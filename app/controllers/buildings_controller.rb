class BuildingsController < ApplicationController
  before_action :find_building, only:[:show, :update, :destroy, :edit]
  before_action :authenticate, only: [:index, :show, :new, :edit, :create, :destroy]

  def index
    @buildings = current_agent.buildings
  end

  def new
    @building = Building.new
  end

  def edit
  end

  def show
    @apartments = @building.apartments.select{ |apartment| apartment.agent_id == current_agent.id}
  end

  def create
    @building = Building.create(building_params)
    if @building
      redirect_to @building
       flash[:success] = "Building successfully created!"
    else
      render 'new'
    end
  end

  def destroy
    @building.destroy
    redirect_to buildings_path
  end

  def update
    if @building.update(building_params)
      redirect_to building_path(@building)
    else
      flash[:error]
      render 'edit'
    end
  end

  private
  def find_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:name, :address)
  end
end
