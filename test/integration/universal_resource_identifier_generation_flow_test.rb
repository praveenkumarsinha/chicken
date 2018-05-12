require 'test_helper'

class UniversalResourceIdentifierGenerationFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "visit index page" do
    get "/"
    assert_select "input[type=text][placeholder='An URL want to shorten']"
    assert_select "input[type=submit][value='Short it!']"
  end

  test "creating a shortenend URL" do
    process :post, '/universal_resource_identifier',
            params: {"universal_resource_identifier" => {"long_url" => "praveen"}},
            xhr: true

    assert_equal "universal_resource_identifier", @controller.controller_name
    assert_equal "create", @controller.action_name

    assert_match "Failed to create shorten-d URL for", @response.body

    process :post, '/universal_resource_identifier',
            params: {"universal_resource_identifier" => {"long_url" => "https://www.singaporeair.com/en_uk/in/travel-info/charges-changes/taxes-service-fees/"}},
            xhr: true

    assert_match "Great", @response.body
    assert_match "Here you go,", @response.body
    assert_match "https://www.singaporeair.com/en_uk/in/travel-info/charges-changes/taxes-service-fees/", @response.body
    assert_match "/s/Ef6Ltq", @response.body
  end

  test "visit an invalid shortenend URL" do
    get "/s/123456"
    assert_response :not_found
  end

  test "visit a shortenend URL" do
    get "/s/Ef6Ltq"
    assert_response :redirect
    assert_redirected_to "https://www.singaporeair.com/en_uk/in/travel-info/charges-changes/taxes-service-fees/"
  end

  test "getting stats from an invalid shortenend URL" do
    process :get, '/uri/S0me3f'
    assert_response :not_found
  end

  test "getting stats from a valid shortenend URL" do
    process :get, '/uri/Ef6Ltq'

    assert_response :success

    assert_equal "universal_resource_identifier", @controller.controller_name
    assert_equal "show", @controller.action_name

    assert_equal "application/json", @response.content_type
    assert_equal "https://www.singaporeair.com/en_uk/in/travel-info/charges-changes/taxes-service-fees/", JSON.parse(@response.body)['long_url']
    assert_equal "Ef6Ltq", JSON.parse(@response.body)['short_url_id']
    assert_equal 3, JSON.parse(@response.body)['hits'].size
  end

end
