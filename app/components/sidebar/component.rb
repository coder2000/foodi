# frozen_string_literal: true

class Sidebar::Component < ViewComponent::Base
  delegate :fa_icon, to: :helpers

  attr_accessor :links

  def initialize(links:)
    @links = links
  end
end