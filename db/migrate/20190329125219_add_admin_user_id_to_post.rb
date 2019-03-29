# frozen_string_literal: true

class AddAdminUserIdToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :admin_user_id, :integer, after: :id, null: false
  end
end
