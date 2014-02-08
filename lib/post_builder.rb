class PostBuilder
  attr_accessor :post_id, :title, :tags, :author, :featured, :summary, :created_at, :post_date, :link, :long_read, :partial

  def self.load_all_posts(config_file)
    $/="\n\n"
    File.open(config_file, "r").map do |post|
      post
    end
  end

  def self.load_yaml(posts)
    posts.map do |post|
      YAML::load(post)
    end
  end

  def self.save_posts_to_db
    posts = load_all_posts("./config/posts.yaml")
    load_yaml(posts).each do |post|
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
     created_at: set_created_at(p),
     post_date: post_date,
     link: link,
     long_read: long_read,
     partial: partial
     )
  end

  private
  def set_created_at(post)
    self.created_at = DateTime.now if post.created_at.nil?
  end



end