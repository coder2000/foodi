class Sidebar::User < ViewComponent::Base
  delegate :current_user, to: :controller
end
