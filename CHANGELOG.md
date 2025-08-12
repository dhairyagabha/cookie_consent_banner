# Changelog

## [0.1.0] - 2025-08-12
### Added
- Initial release of the `cookie_consent` Rails engine gem.
- Turbo Frame–powered cookie consent modal with support for dynamic rendering and preference submission without full page reload.
- Rails generator (`rails generate cookie_consent:install`) to install:
  - `cookie_consent.rb` initializer file for configuration
  - Locale YAML file for translatable modal content
  - `_modal.html.erb` partial for modal customization
- Controller concern `CookieConsent::Consentable` to check and manage consent status across all pages.
- Configurable cookie categories with name and description loaded from YAML.
- Automatic display logic to show the modal only when consent is missing.
- Basic locale file structure with example cookie categories.
