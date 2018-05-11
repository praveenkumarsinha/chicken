require 'test_helper'

class UniversalResourceIdentifierControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get to original_url on visit by short_url_id" do
    get visit_shorted_url(short_url_id: universal_resource_identifiers(:second_one).short_url_id)
    assert_redirected_to 'http://getbootstrap.com/docs/4.0/components/forms'
  end

end
