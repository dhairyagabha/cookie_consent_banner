module CookieConsent
  module Consentable
    extend ActiveSupport::Concern

    included do
      before_action :set_cookie_consent
    end

    private

    def set_cookie_consent
      @show_cookie_consent = cookies[:cookie_preferences].blank?
    end
  end
end