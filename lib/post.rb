require 'yaml'

class Post < ActiveRecord::Base
  validates_uniqueness_of :post_id

  def self.reset
    Post.all.each {|p| p.delete}
  end

  def to_s
    title.gsub(/ /,  "_").downcase
  end

  def long_read?
    long_read
  end

end

