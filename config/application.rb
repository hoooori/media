# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Media
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # i18n setting
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # validation errorが発生した際、フォームにdivタグを生成しない
    config.action_view.field_error_proc = proc do |html_tag, _|
      html_tag.to_s.html_safe
    end

    config.assets.paths << Rails.root.join('node_modules') # application.jsからnode_modulesを読み込めるようにする
    config.action_controller.include_all_helpers = false # viewから使えるhelperメソッドを制限する

    # reference: https://qiita.com/yuutetu/items/135b1c8ab512208aebfe
    config.generators do |g| # rails g 実行時に以下のファイルを生成しない
      g.javascripts false # coffeeスクリプト
      g.test_framework false # テストファイル
      g.stylesheets false # cssファイル
    end
  end
end
