require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit root_url
    assert_selector "input[type=text]"
    assert_selector "input[type=submit]"
  end

end
