# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :eyecatch, EyecatchUploader # eyecatchカラムとcarrierwaveのuploaderを紐付け

  validates :title,     presence: true
  validates :content,   presence: true
  validates :eyecatch,  presence: true
end
