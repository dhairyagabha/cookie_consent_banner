module CookieConsent
  class Engine < ::Rails::Engine
    isolate_namespace CookieConsent

    initializer :append_locales do |app|
      locales_path = root.join("config", "locales", "**", "*.yml").to_s
      I18n.load_path += Dir[locales_path]
    end
  end
end
