require "cookie_consent/version"
require "cookie_consent/engine"
require "cookie_consent/helper"
require "cookie_consent/railtie"
require "cookie_consent/configuration"

module CookieConsent
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end
