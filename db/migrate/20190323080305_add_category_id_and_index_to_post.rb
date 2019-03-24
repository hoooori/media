# frozen_string_literal: true

class AddCategoryIdAndIndexToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :category_id, :integer, after: :id, null: false, default: 0

    add_index :posts, :title, unique: true
    add_index :posts, :category_id
  end
end
