require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PoteShare
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # アプリケーション側のタイムゾーン
    config.time_zone = "Tokyo"
    # DB側から受け取った時刻をどのタイムゾーンとして解釈するか
    config.active_record.default_timezone = :local
    # デフォルトは:enになっている
    config.i18n.default_locale = :ja
    # localeファイルの読み込み設定
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.autoload_paths += Dir.glob("#{config.root}/app/uploaders")
  end
end
