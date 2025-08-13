module CookieConsentBanner
  module Consentable
    extend ActiveSupport::Concern

    included do
      before_action :set_cookie_consent_banner
    end

    private

    def set_cookie_consent_banner
      @show_cookie_consent_banner = cookies[:cookie_preferences].blank?
    end
  end
end
