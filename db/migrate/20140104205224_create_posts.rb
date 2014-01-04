class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :tags
      t.string :author
      t.boolean :featured
      t.string :summary
    end
  end
end
