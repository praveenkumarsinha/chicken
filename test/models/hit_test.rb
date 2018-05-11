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

end
