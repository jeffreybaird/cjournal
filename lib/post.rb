require 'yaml'

class Post < ActiveRecord::Base
  validates_uniqueness_of :post_id

  def to_s
    title.gsub(/ /,  "_").downcase
  end

  def long_read?
    long_read
  end

end

