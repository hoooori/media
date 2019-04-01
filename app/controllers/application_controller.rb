# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    return admin_posts_path if resource.class == AdminUser
  end

  def after_sign_out_path_for(resource)
    return new_admin_user_session_path if resource == :admin_user
  end

  def provide_categories
    @categories = Category.all
  end

  def create_flash_message(result, action, record, attribute)
    I18n.t("flash.default.#{result}", action: I18n.t("actions.default.#{action}"), obj: "#{record.class.model_name.human}「#{record[attribute]}」")
  end
end
