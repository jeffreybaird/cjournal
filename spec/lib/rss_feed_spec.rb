require_relative 'spec_helper'

require 'rss_feed'
require 'post_builder'

describe RssFeed do
    include Helpers

  let(:config_file){
    Helpers.config_file
  }
  let(:rss){
    file = Tempfile.new('config')
    file.write(config_file)
    file.read.split("\n\n")
    loaded_posts = PostBuilder.load_all_posts(file.path)
    posts = PostBuilder.load_yaml(loaded_posts)
    rss = RssFeed.new(posts)
}

  describe "new" do
    it "initializes with a group of posts" do
      expect(rss.class).to eq(RssFeed)
    end

    it "has a lists of posts" do
      expect(rss.posts.map(&:post_id)).to eq([1, 2])
    end
  end

  describe "rss_feed" do
    it "returns a feed for the test posts" do
      Time.stub(:now).and_return(Time.new(2014,02,22))
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<feed xmlns=\"http://www.w3.org/2005/Atom\"\n  xmlns:dc=\"http://purl.org/dc/elements/1.1/\">\n  <author>\n    <name>Clare Lennon</name>\n  </author>\n  <id>http://clarelennon.com/feed.rss</id>\n  <title>Example Feed</title>\n  <updated>2014-02-22T00:00:00-08:00</updated>\n  <entry>\n    <id>clarelennon.com/fast</id>\n    <link href=\"clarelennon.com/fast\"/>\n    <title>Fast</title>\n    <updated>2014-01-01T00:00:00-08:00</updated>\n    <dc:date>2014-01-01T00:00:00-08:00</dc:date>\n  </entry>\n  <entry>\n    <id>clarelennon.com/fast</id>\n    <link href=\"clarelennon.com/fast\"/>\n    <title>Fast</title>\n    <updated>2014-01-01T00:00:00-08:00</updated>\n    <dc:date>2014-01-01T00:00:00-08:00</dc:date>\n  </entry>\n  <dc:date>2014-02-22T00:00:00-08:00</dc:date>\n</feed>"
      expect(rss.rss_feed.to_s).to eq(expected)
    end
  end
end