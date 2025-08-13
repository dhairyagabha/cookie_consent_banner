require "cookie_consent_banner/version"
require "cookie_consent_banner/engine"
require "cookie_consent_banner/helper"
require "cookie_consent_banner/railtie"
require "cookie_consent_banner/configuration"
require "turbo-rails"


module CookieConsentBanner
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end
