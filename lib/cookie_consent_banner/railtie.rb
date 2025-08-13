module CookieConsentBanner
  class Railtie < Rails::Railtie
    initializer "cookie_consent_banner.view_helpers" do
      ActiveSupport.on_load(:action_view) do
        include CookieConsentBannerHelper
      end
    end
  end
end
