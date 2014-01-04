class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :title
      t.string :tags
      t.string :author
      t.boolean :featured
      t.string :summary
    end
  end
end
