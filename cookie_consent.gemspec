require_relative "lib/cookie_consent/version"

Gem::Specification.new do |spec|
  spec.name        = "cookie_consent"
  spec.version     = CookieConsent::VERSION
  spec.authors     = [ "Dhairya Gabhawala" ]
  spec.email       = [ "gabhawaladhairya@gmail.com" ]
  spec.homepage    = "https://www.dhairyagabhawala.com/projects/ruby-gem-cookie-consent"
  spec.summary     = "A Rails engine gem that displays a Turbo Frame–powered cookie consent modal with configurable locales and consent levels, storing user preferences server-side."
  spec.description = "This gem provides a Rails engine to easily integrate a cookie consent modal into your Rails application. It leverages Turbo Frames to render the modal dynamically and handle consent submissions without full page reloads."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dhairyagabha/cookie_consent"
  spec.metadata["changelog_uri"] = "https://github.com/dhairyagabha/cookie_consent/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.require_paths = [ "lib" ]

  spec.add_dependency "rails", ">= 8.0.2"
end
