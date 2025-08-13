module CookieConsentBanner
  class Configuration
    attr_accessor :cookie_buckets
    attr_accessor :cookie_expiration

    def initialize
      @cookie_buckets = []
      @cookie_expiration = ""
    end
  end
end
