module SeoHelper
  # usage in controller:
  # @mata_hash = {
  #   author: foo,
  #   description: foo,
  #   generator: foo,
  #   keywords: foo
  # }
  def meta_tags **meta_hash
    meta_hash  = meta_hash.presence || @meta_hash || return
    result = ''.html_safe
    meta_hash.each do |name, content|
      result += tag(:meta, name: name, content: content)
    end
    result
  end

  # usage in controller:
  # @og_hash = {
  #   title: "foo",
  #   type: "foo",
  #   url: "foo",
  #   image: "foo",
  #   description: "foo"
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
