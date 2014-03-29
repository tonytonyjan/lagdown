module OpenGraphHelper
  # usage:
  # @og_hash = {
  #   title: @event.name,
  #   type:  :website,
  #   url: event_url(@event),
  #   image: @event.image,
  #   description: @event.brief
  # }
  def og_meta_tags **og_hash
    og_hash = og_hash.presence || @og_hash || return
    result = "".html_safe
    og_hash.each do |name, value|
      result += tag(:meta, property: "og:#{name}", content: value.to_s)
    end
    result
  end
end
