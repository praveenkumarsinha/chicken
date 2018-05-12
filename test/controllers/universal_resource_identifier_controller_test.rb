require 'test_helper'

class UniversalResourceIdentifierControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get to original_url on visit by short_url_id" do
    get visit_shortened_url(short_url_id: universal_resource_identifiers(:second_one).short_url_id)
    assert_redirected_to 'http://getbootstrap.com/docs/4.0/components/forms'
  end

  test "should get 'not_found' on api request of non existent short_url_id" do
    get universal_resource_identifier_url(id: 'nonexi')
    assert_response :not_found
  end

  test "should get 'success' on api request of existent short_url_id" do
    get universal_resource_identifier_url(universal_resource_identifiers(:third_one).short_url_id)
    assert_response :success
    assert_equal "application/json", @response.content_type

    assert_equal "https://www.singaporeair.com/en_uk/in/travel-info/charges-changes/taxes-service-fees/", JSON.parse(@response.body)['long_url']
    assert_equal "Ef6Ltq", JSON.parse(@response.body)['short_url_id']
    assert_equal 3, JSON.parse(@response.body)['hits'].size
  end

end
