require "rss"

rss = RSS::Maker.make("2.0") do |maker|
  maker.channel.language = "en"
  maker.channel.author = "matz"
  maker.channel.updated = Time.now.to_s
  maker.channel.link = "http://www.ruby-lang.org/en/feeds/news.rss"
  maker.channel.title = "Example Feed"
  maker.channel.description = "A longer description of my feed."
  maker.items.new_item do |item|
    item.link = "http://www.ruby-lang.org/en/news/2010/12/25/ruby-1-9-2-p136-is-released/"
    item.title = "Ruby 1.9.2-p136 is released"
    item.updated = Time.now.to_s
  end
end

puts rss