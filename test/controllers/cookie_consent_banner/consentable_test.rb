require "test_helper"

class ConsentableTest < ActionDispatch::IntegrationTest
  # Create a temporary controller in the test environment to test the concern
  class DummyController < ActionController::Base
    include CookieConsentBanner::Consentable

    def index
      render plain: @show_cookie_consent_banner.to_s
    end
  end

  setup do
    # Define a temporary route for our dummy controller
    Rails.application.routes.draw do
      get "/dummy", to: "consentable_test/dummy#index"
    end
  end

  teardown do
    # Reload the original routes after the test
    Rails.application.reload_routes!
  end

  test "sets @show_cookie_consent_banner to true when cookie is missing" do
    get "/dummy"
    assert_response :success
    assert_equal "true", @response.body
  end

  test "sets @show_cookie_consent_banner to false when cookie exists" do
    cookies[:cookie_preferences] = "0,1"
    get "/dummy"
    assert_response :success
    assert_equal "false", @response.body
  end
end
