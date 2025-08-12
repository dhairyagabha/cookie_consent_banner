Rails.application.routes.draw do
  mount CookieConsent::Engine => "/cookie_consent"
end
