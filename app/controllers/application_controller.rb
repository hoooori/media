# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def create_flash_message(result, action, record, attribute)
    I18n.t("flash.default.#{result}", action: I18n.t("actions.default.#{action}"), obj: "#{record.class.model_name.human}「#{record[attribute]}」")
  end
end
