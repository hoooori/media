class AddCategoryIdAndIndexToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :category_id, :integer, after: :id, null: false

    add_index :posts, :title, unique: true
    add_index :posts, :category_id
  end
end
