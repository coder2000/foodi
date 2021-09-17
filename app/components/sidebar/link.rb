class Sidebar::Link < ViewComponent::Base
  delegate :fa_icon, to: :helpers

  def initialize(link:, classes:, active:, inactive:)
    @name = link[:name]
    @url = link[:url]
    @classes = Array.wrap(classes[:link])
    @active = Array.wrap(active[:link])
    @inactive = Array.wrap(inactive[:link])

    @icon_classes = Array.wrap(classes[:icon])
    @icon_active = Array.wrap(active[:icon])
    @icon_inactive = Array.wrap(inactive[:icon])

    @icon = link[:icon]
  end

  def call
    if request.path == @url
      @classes.push(*@active)
      @icon_classes.push(*@icon_active)
    else
      @classes.push(*@inactive)
      @icon_classes.push(*@icon_inactive)
    end

    link_to @url, class: @classes do
      fa_icon(@icon, class: @icon_classes) + @name
    end
  end
end
