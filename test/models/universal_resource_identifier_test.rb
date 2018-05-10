require 'test_helper'

class UniversalResourceIdentifierTest < ActiveSupport::TestCase

  # test "the truth" do
  #   assert true
  # end

  test 'should not save URI with invalid long_url' do
    uri = UniversalResourceIdentifier.new
    uri.short_url_id = 'tes123'

    assert_not uri.valid?
    assert_equal ["can't be blank", "is not a valid http url"], uri.errors[:long_url]

    uri.long_url = "praveen.com"
    assert_not uri.valid?
    assert_equal ["is not a valid http url"], uri.errors[:long_url]

    uri.long_url = "http://test-domain.com/some/path"
    assert uri.save
  end

  test 'should not save URI with invalid short_url_id' do
    uri = UniversalResourceIdentifier.new
    uri.long_url = "http://test-domain.com/some/path"

    assert_not uri.valid?
    assert_equal ["can't be blank", "is too short (minimum is 3 characters)"], uri.errors[:short_url_id]

    uri.short_url_id = 'te'
    assert_not uri.valid?
    assert_equal ["is too short (minimum is 3 characters)"], uri.errors[:short_url_id]

    uri.short_url_id = 'test1234'
    assert_not uri.valid?
    assert_equal ["is too long (maximum is 6 characters)"], uri.errors[:short_url_id]

    uri.short_url_id = 'tes123'
    assert uri.save
  end

end
