# frozen_string_literal: true

class Sidebar::Component < ViewComponent::Base
  delegate :fa_icon, to: :helpers
end
