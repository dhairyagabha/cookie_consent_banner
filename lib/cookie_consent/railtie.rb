module CookieConsent
  class Railtie < Rails::Railtie
    initializer "cookie_consent.view_helpers" do
      ActiveSupport.on_load(:action_view) do
        include CookieConsentHelper
      end
    end
  end
end