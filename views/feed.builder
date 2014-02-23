xml.instruct! :xml, :version => '1.0'
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Clare Lennon"
    xml.description "Website and Blog for writer Clare Lennon"
    xml.link "http://clarelennon.com/]"

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.link "clarelennon.com/#{post.link}"
        xml.description post.summary
        xml.pubDate Time.new(post.post_date.to_s)
      end
    end
  end
end