require "test_helper"

module CookieConsentBanner
  class ConsentsControllerTest < ActionDispatch::IntegrationTest
    test "should respond with turbo_stream for new" do
      get cookie_consent_banner.new_consent_path,
          headers: { "Accept" => Mime[:turbo_stream].to_s }

      assert_response :success
      assert_equal Mime[:turbo_stream].to_s, @response.media_type
      assert_includes @response.body, "turbo-stream"
    end

    # Test POST /create for required_only in turbo_stream format
    test "should set required_only cookies and respond with turbo_stream" do
      post cookie_consent_banner.consents_path,
           params: { consent_type: "required_only" },
           headers: { "Accept" => Mime[:turbo_stream].to_s }

      assert_response :success
      assert_equal "0", cookies[:cookie_preferences]
      assert_equal Mime[:turbo_stream].to_s, @response.media_type
      assert_includes @response.body, "turbo-stream"
    end

    # Test POST /create for accept_all in HTML format
    test "should set all cookies and redirect for accept_all" do
      CookieConsentBanner.configuration.cookie_buckets = [
        { name: "Essential", description: "Required cookies" },
        { name: "Analytics", description: "Tracking cookies" }
      ]

      post cookie_consent_banner.consents_path,
           params: { consent_type: "accept_all" },
           headers: { "Accept" => Mime[:turbo_stream].to_s }

      assert_response :success
      expected_value = "0,1"
      assert_equal expected_value, cookies[:cookie_preferences]
      assert_includes @response.body, "turbo-stream"
    end

    # Test POST /create for customized selection
    test "should set customized cookies" do
      preferences = [ "0", "1" ]

      post cookie_consent_banner.consents_path,
           params: { consent_type: "customized", cookie_preferences: preferences },
           headers: { "Accept" => Mime[:turbo_stream].to_s }

      assert_response :success
      assert_equal "0,1", cookies[:cookie_preferences]
      assert_includes @response.body, "turbo-stream"
    end
  end
end
