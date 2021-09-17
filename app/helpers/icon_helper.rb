module IconHelper
  def fa_icon(name, options = {})
    weight = options.delete(:weight) || "fa-thin"
    options[:class] = [weight, "fa-#{name}", options.delete(:class)]
    tag.i(nil, **options)
  end
end
