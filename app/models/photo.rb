# frozen_string_literal: true

class Photo < ApplicationRecord
  mount_uploader :image, PhotoUploader

  validates :image, presence: true

  def self.bulk_insert(params)
    Photo.transaction do
      params.each do |param|
        record = new(image: File.open(param.path))
        return record unless record.save
      end
      true
    end
  end
end
