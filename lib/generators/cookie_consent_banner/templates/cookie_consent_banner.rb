CookieConsentBanner.configure do |config|
  config.cookie_buckets = [ :necessary, :analytics, :marketing ]
  config.cookie_expiration = 1.year
end
