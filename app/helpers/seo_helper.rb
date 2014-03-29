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
    meta_hash.inject(''.html_safe){ |memo, obj| memo += tag(:meta, name: obj[0], content: obj[1]) }
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
    og_hash.inject(''.html_safe){ |memo, obj| memo += tag(:meta, property: "og:#{obj[0]}", content: obj[1].to_s) }
  end
end
