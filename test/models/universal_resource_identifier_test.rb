require 'test_helper'

class UniversalResourceIdentifierTest < ActiveSupport::TestCase

  # test "the truth" do
  #   assert true
  # end

  test 'should not save URI with invalid long_url' do
    uri = UniversalResourceIdentifier.new

    assert_not uri.valid?
    assert_equal ["can't be blank", "is not a valid http url"], uri.errors[:long_url]

    uri.long_url = "praveen.com"
    assert_not uri.valid?
    assert_equal ["is not a valid http url"], uri.errors[:long_url]

    uri.long_url = "http://test-domain.com/some/path"
    assert uri.save
  end

end
