require 'yaml'

class Post < ActiveRecord::Base
  validates_uniqueness_of :post_id

  def to_s
    title.gsub(/ /,  "_").downcase
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

