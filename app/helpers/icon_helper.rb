module IconHelper
  def fa_icon(name, options = {})
    weight = options.delete(:weight) || "fat"
    options[:class] = [weight, "fa-#{name}", options.delete(:class)]
    tag.i(nil, **options)
  end
end
