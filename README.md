# Cookie Consent Banner Rails Engine
**Cookie Consent Banner Rails Engine** is a plug-and-play solution to display, manage, and persist cookie consent preferences in your Rails application.
It uses **Turbo Frames** for smooth rendering and updating of the consent popup without full-page reloads.

## Features
* **Quick setup** with Rails generator
* **Locale support** for customizing messages
* **Turbo Frames** integration for a seamless user experience
* Centralized **controller concern** for validating consent across the application
* Ready-to-use **view partial** for the cookie consent modal

## Installation
Add this line to your application's Gemfile:

```ruby
gem "cookie_consent_banner"
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install cookie_consent_banner
```

## Setup
Run the install generator:
```bash
rails generate cookie_consent_banner:install
```

This will create:
1. **Initializer:** `config/initializers/cookie_consent_banner.rb`
   Configure cookie consent options, such as expiration time and categories.
   ```ruby
    # Add symbols for the cookie categories to the below array
    config.cookie_buckets = []
    # Update the default cookie expiration below
    config.cookie_expiration = 1.year
   ```
2. **Locale file:** `config/locales/cookie_consent_banner.en.yml`
   Customize text, labels, and messages for the consent modal.
3. **View partial:** `app/views/cookie_consent_banner/_modal.html.erb`
   The modal that appears to the user requesting their consent.

## Usage
### 1. Mount the engine
To enable the controller routes required to send the consents calls, add the following to the routes file:
```ruby
mount CookieConsentBanner::Engine => "/cookie-consent-banner"
```

### 2. Include the concern
To ensure cookie consent is validated regardless of the page the user enters from, include the provided concern in you ApplicationController:
```ruby
class ApplicationController < ActionController::Base
  include CookieConsentBanner::Consentable
end
```
This makes the instance variable `@show_cookie_consent_banner` available in your views, which indicates whether the consent modal should be displayed.

### 3. Display the modal
Add the modal partial to your application layout (e.g., `app/views/layouts/application.html.erb`):

```erb
<%= render_cookie_consent_banner_modal if @show_cookie_consent_banner %>
```

Add the turbo frame to your application layout (e.g., `app/views/layouts/application.html.erb`):

```erb
<%= turbo_frame_tag :cookie_consent_banner_modal_container %>
```

### 4. Understanding the YAML File:
All items related to the Cookie Consent Modal are nested in the `cookie_consent_banner_modal` object. YAML file will provide support for translating the content into multiple languages.

Add the cookie categories in the `categories` object. Each category requires the following attributes:
1. Name: Readable name of the cookie category. This is used to present it in the modal.
2. Description: Description presented under the cookie category in the modal.
3. Cookies: Contains the individual list of cookies in the respective categories. Each cookie has following attributes:
   1. Name: Cookie Name
   2. Description: What purpose does this cookie serve.
   3. Domain (Optional): Which domain this cookie is set by.
   4. Service (Optional): Provide the name of the serice this is related to.
   *You can add as many attributes as you desire to the cookie object to expose to the user. Make sure to update the view partial to share it with the user.
4. Buttons: This contains keys for various buttons in the experience.

```YAML
en:
  cookie_consent_banner_modal:
    title: "We use cookies"
    description: "We use cookies to improve your experience on our website. You can choose which types of cookies to allow."
    categories:
      essential:
        name: "Essential"
        description: "Required for the site to work."
        cookies:
          - name: "_session_id"
            description: "Maintains your session while you browse the site."
          - name: "csrf_token"
            description: "Helps prevent cross-site request forgery attacks."
      analytics:
        name: "Analytics"
        description: "Help us understand how you use the site."
        cookies:
          - name: "_session_id"
            description: "Maintains your session while you browse the site."
          - name: "csrf_token"
            description: "Helps prevent cross-site request forgery attacks."
      marketing:
        name: "Marketing"
        description: "Personalize ads and content."
        cookies:
          - name: "_session_id"
            description: "Maintains your session while you browse the site."
          - name: "csrf_token"
            description: "Helps prevent cross-site request forgery attacks."
    buttons:
      necessary: "Necessary Only"
      accept_all: "Accept All"
      save_preferences: "Save Preferences"
```

### 5. How it works
* On page load, if the user's cookie consent has not been set, `@show_cookie_consent_banner` will be `true`, triggering the modal.
* The modal is rendered inside a **Turbo Frame** from smooth updates.
* When the user accepts or changes preferences, the Turbo Frame sends the update to the controller action, which sets the cookie and hides the modal.

### Customization
* **Style:** Update `_modal.html.erb` to match your site's design and configure the default consent, and how obtrusive the experience needs to be.
* **Translations:** Edit `config/locales/cookie_consent_banner.en.yml` for copy changes.
* **Behavior:** Adjust `config/initializer/cookie_consent_banner.rb` to modify consent handling.

### Example Flow
1. User visits any page.
2. concern checks for cookie consent.
3. If not set -> Modal appears using Turbo Frame.
4. User interacts with modal -> Turbo sends form request.
5. Controller updates cookie and hides modal.

## Requirements
1. Rails 7+
2. Hotwire/Turbo enabled in your application

## Contributing
Bug reports and pull requests are welcome on GitHub at [https://github.com/dhairyagabha/cookie_consent_banner](https://github.com/dhairyagabha/cookie_consent_banner). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
