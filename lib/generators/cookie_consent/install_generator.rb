require "rails/generators"

module CookieConsent
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def copy_initializer
        template "cookie_consent.rb", "config/initializers/cookie_consent.rb"
      end

      def copy_locale
        copy_file "en.yml", "config/locales/cookie_consent.en.yml"
      end

      def copy_view
        copy_file "_modal.html.erb", "app/views/cookie_consent/_modal.html.erb"
      end
    end
  end
end