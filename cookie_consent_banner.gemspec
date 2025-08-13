require_relative "lib/cookie_consent_banner/version"

Gem::Specification.new do |spec|
  spec.name        = "cookie_consent_banner"
  spec.version     = CookieConsentBanner::VERSION
  spec.authors     = [ "Dhairya Gabhawala" ]
  spec.email       = [ "gabhawaladhairya@gmail.com" ]
  spec.homepage    = "https://www.dhairyagabhawala.com/projects/ruby-gem-cookie-consent-banner"
  spec.summary     = "Rails engine for managing cookie consent with Turbo Streams."
  spec.description = "A Rails engine providing cookie consent modal, preferences management, and localization using Turbo Streams."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dhairyagabha/cookie_consent_banner"
  spec.metadata["changelog_uri"] = "#{spec.metadata["source_code_uri"]}/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.require_paths = [ "lib" ]

  spec.add_dependency "rails", ">= 7.0"
  spec.add_dependency "turbo-rails"
end
