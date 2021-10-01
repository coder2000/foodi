class HouseholdsController < ApplicationController
  def new
    @household = Household.new
  end

  def create
    @household = Household.new(household_params)

    if @household.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def household_params
    params.require(:household).permit(:name, :street_address, :city, :state, :subdomain)
  end
end
