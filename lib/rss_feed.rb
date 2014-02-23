require "rss"
class RssFeed
  attr_accessor :posts
  def initialize(posts)
    self.posts = posts
  end
  def rss_feed
    rss = RSS::Maker.make("atom") do |maker|
      maker.channel.author = "Clare Lennon"
      maker.channel.updated = Time.now.to_s
      maker.channel.about = "http://clarelennon.com/feed.rss"
      maker.channel.title = "Example Feed"
      posts.each do |post|
        maker.items.new_item do |item|
          item.link = "clarelennon.com/#{post.link}"
          item.title = post.title
          item.updated = Time.new(post.post_date.to_s)
        end
      end
    end
    rss
  end
end