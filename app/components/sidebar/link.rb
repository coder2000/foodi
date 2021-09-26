class Sidebar::Link < ViewComponent::Base
  delegate :fa_icon, to: :helpers

  def initialize(link:, classes:, active:, inactive:, delete: false)
    @name = link[:name]
    @url = link[:url]
    @classes = Array.wrap(classes[:link])
    @active = Array.wrap(active[:link])
    @inactive = Array.wrap(inactive[:link])

    @icon_classes = Array.wrap(classes[:icon])
    @icon_active = Array.wrap(active[:icon])
    @icon_inactive = Array.wrap(inactive[:icon])

    @icon = link[:icon]

    @delete = delete
  end

  def call
    html_options = {}

    if request.path == @url
      @classes.push(*@active)
      @icon_classes.push(*@icon_active)
    else
      @classes.push(*@inactive)
      @icon_classes.push(*@icon_inactive)
    end

    html_options[:class] = @classes

    if @delete
      html_options[:data] = {turbo_method: :delete}
    end

    link_to @url, html_options do
      fa_icon(@icon, class: @icon_classes) + @name
    end
  end
end
