class Feature < ActiveRecord::Base
  attr_accessible :title, :tags, :author, :featured, :summary, :created_at

  before_save :set_created_at

  def set_created_at
    created_at = DateTime.now
  end
end
