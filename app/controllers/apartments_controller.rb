class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:index, :show, :new, :edit, :create, :destroy]
  
  def index
    @apartments = current_agent.apartments
  end

  def show
  end

  def new
    @apartment = Apartment.new
    @buildings = Building.all
    @leases = Lease.all
    @agents = Agent.all
  end

  def edit
    @buildings = Building.all
    @leases = Lease.all
    @agents = Agent.all
  end

  def create
    @apartment = Apartment.create!(apartment_params)
    @apartment.agent_id = current_agent.id
    @apartment.save
    redirect_to @apartment

  end

  def update
    @apartment.update(apartment_params)
    redirect_to @apartment
  end

  def destroy
    @apartment.destroy
    redirect_to apartments_path
  end

  private

    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    def apartment_params
      params.require(:apartment).permit(:unit_no, :size, :bedrooms, :rent, :electricity, :water, :gas, :lease_id, :building_id, :agent_id, :name, :search)
    end
end
