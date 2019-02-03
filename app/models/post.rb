class Post < ApplicationRecord
  validates :title,     presence: true
  validates :content,   presence: true
  validates :eyecatch,  presence: true

  mount_uploader :eyecatch, EyecatchUploader # eyecatchカラムとcarrierwaveのuploaderを紐付け
end
