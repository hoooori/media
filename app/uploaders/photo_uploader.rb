# frozen_string_literal: true

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  process resize_to_limit: [640, 640]

  def store_dir
    'uploads/photos/'
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  # レコードを削除すると同名の画像ファイルが全て消えてしまう為、ファイル名をユニークに
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
