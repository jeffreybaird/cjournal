class Post < ActiveRecord::Base
  attr_accessible :title, :tags, :author, :featured, :summary, :created_at, :link, :long_read

  before_save :set_created_at

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
