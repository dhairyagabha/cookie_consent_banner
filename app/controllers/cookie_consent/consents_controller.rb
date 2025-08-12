module CookieConsent
  class ConsentsController < ApplicationController
    def new
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append(:cookie_consent_modal_container, partial: "cookie_consent/modal"), locals: { config: CookieConsent.configuration } }
        format.html { redirect_to root_path }
      end
    end

    def create
      if params[:button].to_sym === :required_only
        preferences = [ 0 ]
      elsif params[:button].to_sym === :accept_all
        preferences = (0..CookieConsent.configuration.cookie_buckets.length-1).to_a
      elsif params[:button].to_sym === :customized
        preferences = params[:cookie_preferences]
      end

      cookies[:cookie_preferences] = {
        value: preferences.join(","),
        expires: 1.year.from_now
      }

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove("cookie-consent-modal") }
        format.html { redirect_to root_path }
      end
    end
  end
end
