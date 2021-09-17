# frozen_string_literal: true

class Sidebar::Component < ViewComponent::Base
  delegate :fa_icon, to: :helpers

  attr_accessor :links

  def initialize(links:)
    @links = links

    @classes = {link: "group flex items-center px-2 py-2 text-sm font-medium rounded-md", icon: "mr-4 flex-shrink-0 h-6 w-6 fa-xl fa-fw"}
    @active = {link: "bg-gray-900 text-white", icon: "text-gray-300"}
    @inactive = {link: "text-gray-300 hover:bg-gray-700 hover:text-white", icon: "text-gray-400 group-hover:text-gray-300"}
  end
end
