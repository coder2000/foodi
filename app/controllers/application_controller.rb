class ApplicationController < ActionController::Base
  before_action :set_links

  private

  def set_links
    @links = [
      {
        name: "Supplies",
        url: supplies_path,
        icon: "parachute-box"
      },
      {
        name: "Shopping List",
        url: "#",
        icon: "shopping-cart"
      },
      {
        name: "Recipes",
        url: "#",
        icon: "book-blank"
      },
      {
        name: "Meal Planner",
        url: "#",
        icon: "calendar-week"
      },
      {
        name: "Calendar",
        url: "#",
        icon: "calendar"
      }
    ]
  end
end
