class PostBuilder
  attr_accessor :post_id, :title, :tags, :author, :featured, :summary, :created_at, :post_date, :link, :long_read, :partial

  def self.load_all_posts
    posts = []
    $/="\n\n"
    File.open("./config/posts.yaml", "r").each do |post|
      posts << YAML::load(post)
    end
    posts
  end

  def self.save_posts_to_db
    load_all_posts.each do |post|
      post.save_to_db
    end
  end

  def initialize(options)
    options.each{ |name, value| instance_variable_set("@#{name}", value) }
  end

  def save_to_db
    p = Post.find_or_create_by(post_id: post_id)
    p.update_attributes(
     title: title,
     tags: tags,
     author: author,
     featured: featured,
     summary: summary,
     created_at: created_at,
     post_date: post_date,
     link: link,
     long_read: long_read,
     partial: partial
     )
  end



end