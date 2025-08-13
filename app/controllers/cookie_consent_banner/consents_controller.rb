module CookieConsentBanner
  class ConsentsController < ApplicationController
    def new
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path }
      end
    end

    def create
      set_consent_cookie

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path }
      end
    end

    private
    def set_consent_cookie
      case params.require(:consent_type)
      when "required_only"
        preferences = [ 0 ]
      when "accept_all"
        preferences = (0..CookieConsentBanner.configuration.cookie_buckets.length-1).to_a
      when "customized"
        preferences = params.require(:cookie_preferences)
      end

      cookies[:cookie_preferences] = {
        value: preferences.join(","),
        expires: CookieConsentBanner.configuration.cookie_expiration.from_now
      }
    end
  end
end
