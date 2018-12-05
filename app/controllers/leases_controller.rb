class LeasesController < ApplicationController
  before_action :get_lease, only: [:show, :edit, :update, :destroy]

  def index
    @leases = Lease.all
  end

  def show

  end

  def new
    @lease = Lease.new
    @apartments = Apartment.all
  end

  def create
    @lease = Lease.create(lease_params)
    update_relationship
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
    params.require(:lease).permit(:tenant_name, :start_date, :exp_date, :apartment_id)
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
