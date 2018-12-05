class LeasesController < ApplicationController
  before_action :get_lease, only: [:show, :edit, :update, :destroy]
  def index
    @leases = Lease.all
  end

  def show

  end

  def new
    @lease = Lease.new
  end

  def create
    @lease = Lease.create(lease_params)
    redirect_to @lease
  end

  def edit

  end

  def update
    @lease.update(lease_params)
    redirect_to @lease
  end

  def destroy
    @lease.destroy
    redirect_to leases_path
  end

  private

  def lease_params
    params.require(:lease).permit(:tenant_name, :start_date, :exp_date)
  end

  def get_lease
    @lease = Lease.find(params[:id])
  end
end
