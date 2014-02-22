class AddCommentTableAndCommentId < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_entry
      t.integer :user_id
    end

    add_column :posts, :comment_id, :integer
  end
end
