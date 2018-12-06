class LeasesController < ApplicationController
  before_action :get_lease, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:index, :show, :new, :edit, :create, :destroy]

  def index
    #@leases = current_agent.leases
    @leases = Lease.all.select{|lease| lease.agent_id == current_agent.id}
  end

  def show

  end

  def new
    @lease = Lease.new
    @apartments = current_agent.apartments
  end

  def create
    @lease = Lease.create(lease_params)
    update_relationship
    @lease.agent_id = current_agent.id
    @lease.save
    redirect_to @lease
  end

  def edit
    @apartments = Apartment.all
  end

  def update
    @lease.update(lease_params)
    update_relationship
    redirect_to @lease
  end

  def destroy
    @apartment = @lease.apartment
    @lease.destroy
    @apartment.lease_id = nil
    @apartment.save
    redirect_to leases_path
  end

  private

  def lease_params
    params.require(:lease).permit(:tenant_name, :start_date, :exp_date, :apartment_id, :agent_id)
  end

  def get_lease
    @lease = Lease.find(params[:id])
  end

  def update_relationship
    @apartment = Apartment.find(@lease.apartment_id)
    @apartment.lease_id = @lease.id
    @apartment.save
  end
end
