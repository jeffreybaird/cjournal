require 'yaml'

class Post
  attr_accessor :title, :tags, :author, :featured, :summary, :created_at, :post_date, :link, :long_read, :partial

  def initialize(options)
    options.each{ |name, value| instance_variable_set("@#{name}", value) }
  end

  def to_s
    title.gsub(/ /,"_").downcase
  end

  def set_created_at
    created_at = DateTime.now
  end

  def long_read?
    long_read
  end

  def link
    return '#' if @link.nil?
    @link
  end

end
