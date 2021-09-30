class DashboardController < ApplicationController
  set_current_tenant_by_subdomain(:household, :subdomain)
  before_action :verify_tenant
end
