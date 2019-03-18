# frozen_string_literal: true

class ChangeDataEyecatchToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :eyecatch, :text
  end
end
