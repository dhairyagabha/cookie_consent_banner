module CookieConsent
  class Configuration
    attr_accessor :cookie_buckets

    def initialize
      @cookie_buckets = []
    end
  end
end