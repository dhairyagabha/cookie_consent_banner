module CookieConsentBanner
  class Engine < ::Rails::Engine
    isolate_namespace CookieConsentBanner

    initializer :append_locales do |app|
      locales_path = root.join("config", "locales", "**", "*.yml").to_s
      I18n.load_path += Dir[locales_path]
    end

    initializer "cookie_consent_banner.helpers" do
      ActiveSupport.on_load(:action_controller_base) do
        helper Turbo::StreamsHelper
        helper CookieConsentBanner::Helper
      end
    end
  end
end
