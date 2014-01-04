class AddCreatedAtToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :created_at, :datetime
  end
end
