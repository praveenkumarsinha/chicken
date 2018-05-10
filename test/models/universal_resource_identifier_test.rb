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

  test 'should not save non-unique long_url' do
    uri_1 = UniversalResourceIdentifier.new
    uri_1.short_url_id = 'tes123'
    uri_1.long_url = "http://test-domain.com/some/path"
    assert uri_1.save

    uri_2 = UniversalResourceIdentifier.new
    uri_2.short_url_id = 'tes456'
    uri_2.long_url = "http://test-domain.com/some/path"
    assert_not uri_2.valid?
    assert_equal ["has already been taken"], uri_2.errors[:long_url]
  end

  test 'should not save URI with invalid short_url_id' do
    uri = UniversalResourceIdentifier.new
    uri.long_url = "http://test-domain.com/some/path"

    assert uri.short_url_id.nil?
    assert uri.valid?
    assert_not uri.short_url_id.nil?

    uri.short_url_id = 'te'
    assert_not uri.valid?
    assert_equal ["is too short (minimum is 3 characters)"], uri.errors[:short_url_id]

    uri.short_url_id = 'test1234'
    assert_not uri.valid?
    assert_equal ["is too long (maximum is 6 characters)"], uri.errors[:short_url_id]

    uri.short_url_id = 'tes123'
    assert uri.save
  end

  test 'should not save non-unique short_url_id' do
    uri_1 = UniversalResourceIdentifier.new
    uri_1.long_url = "http://test-domain.com/some/path/1"
    uri_1.short_url_id = 'tes123'
    assert uri_1.save

    uri_2 = UniversalResourceIdentifier.new
    uri_2.long_url = "http://test-domain.com/some/path/2"
    uri_2.short_url_id = 'tes123'
    assert_not uri_2.valid?
    assert_equal ["has already been taken"], uri_2.errors[:short_url_id]

    uri_3 = UniversalResourceIdentifier.new
    uri_3.long_url = "http://test-domain.com/some/path/3"
    uri_3.short_url_id = 'tes456'
    assert uri_3.save

    assert_raises ActiveRecord::RecordNotUnique do
      uri_3.update_column(:short_url_id, 'tes123')
    end
  end

end
