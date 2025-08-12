CookieConsent::Engine.routes.draw do

  resources :consents, only: [:new, :create]

end
