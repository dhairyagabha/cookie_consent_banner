module CookieConsentHelper
  def render_cookie_consent_modal
    render partial: "cookie_consent/modal", formats: [ :html ], locals: { config: CookieConsent.configuration }
  end
end
