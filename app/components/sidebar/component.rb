# frozen_string_literal: true

class Sidebar::Component < ViewComponent::Base
  attr_accessor :links

  def initialize(links:)
    @links = links
  end
end
