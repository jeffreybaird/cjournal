class AddPostDateLongReadPartialToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :partial, :string
    add_column :posts, :post_date, :datetime
    add_column :posts, :long_read, :boolean
  end
end
