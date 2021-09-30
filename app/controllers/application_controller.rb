class ApplicationController < ActionController::Base
  protected

  def verify_tenant
    if current_tenant.nil?
      redirect_to new_household_path
    end
  end
end
