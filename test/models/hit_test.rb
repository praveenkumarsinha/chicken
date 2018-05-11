require 'test_helper'

class HitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save without universal_resource_identifier' do
    hit = Hit.new
    assert_not hit.valid?
    assert_equal ["must exist"], hit.errors[:universal_resource_identifier]
  end

  test 'should not save without values of bot_hit, ip_address and request_dump' do
    hit = Hit.new
    hit.universal_resource_identifier = universal_resource_identifiers(:first_one)
    assert_not hit.valid?

    assert_equal ["should be either true or false"], hit.errors[:bot_hit]
    assert_equal ["can't be blank"], hit.errors[:ip_address]
    assert_equal ["can't be blank"], hit.errors[:request_dump]

    hit.bot_hit = false
    hit.ip_address = '127.0.0.1'
    hit.request_dump = 'some large request dump'

    assert hit.save
  end

  test 'should auto populate latitude and longitude from ip_address during validation' do
    hit = Hit.new
    hit.universal_resource_identifier = universal_resource_identifiers(:first_one)
    hit.bot_hit = false
    hit.ip_address = '172.217.31.14' # Google's ip
    hit.request_dump = 'some large request dump'

    assert_nil hit.latitude
    assert_nil hit.longitude

    assert hit.valid?

    assert_equal 37.4192, hit.latitude
    assert_equal -122.0574, hit.longitude

    assert hit.save
  end

end
