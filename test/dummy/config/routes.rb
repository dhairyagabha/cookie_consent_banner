Rails.application.routes.draw do
  mount CookieConsentBanner::Engine => "/cookie_consent_banner"
end
