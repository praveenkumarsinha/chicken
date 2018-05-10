require 'test_helper'

class UniversalResourceIdentifierTest < ActiveSupport::TestCase

  # test "the truth" do
  #   assert true
  # end

  test 'should not save URI with invalid long_url' do
    uri = UniversalResourceIdentifier.new

    assert_not uri.valid?
    assert_equal ["can't be blank"], uri.errors[:long_url]
  end

end
