# frozen_string_literal: true

class Admin::PhotosController < ApplicationController
  before_action :authenticate_admin_user!

  def create
    return flash.now[:danger] = I18n.t('flash.file_is_not_selected') unless photo_params

    @result = Photo.bulk_insert(photo_params[:contents])
    flash.now[:success] = bulk_insert_flash_message if @result == true
  end

  private

  def bulk_insert_flash_message
    I18n.t('flash.default.success', action: I18n.t('words.upload'), obj: "#{photo_params[:contents].size}個の#{Photo.model_name.human}")
  end

  def photo_params
    params.require(:photo).permit(contents: [])
  rescue StandardError => e
    logger.error("#{e}: #{e.message}\n" + e.backtrace.join("\n"))
    false
  end
end
