module CookieConsentBannerHelper
  def render_cookie_consent_banner_modal
    render partial: "cookie_consent_banner/modal", formats: [ :html ], locals: { config: CookieConsent.configuration }
  end
end
