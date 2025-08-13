require "rails/generators"

module CookieConsentBanner
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def copy_initializer
        template "cookie_consent_banner.rb", "config/initializers/cookie_consent_banner.rb"
      end

      def copy_locale
        copy_file "en.yml", "config/locales/cookie_consent_banner.en.yml"
      end

      def copy_view
        copy_file "_modal.html.erb", "app/views/cookie_consent_banner/_modal.html.erb"
      end
    end
  end
end
