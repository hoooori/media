# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :eyecatch, EyecatchUploader # eyecatchカラムとcarrierwaveのuploaderを紐付け

  belongs_to :admin_user, optional: true
  belongs_to :category, optional: true # 関連先のモデルのvalidationも実行してるらしいので、optional: trueで無効化

  validates :admin_user, presence: true
  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :eyecatch, presence: true
end
