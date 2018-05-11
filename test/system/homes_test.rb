require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit root_url
    assert_selector "input[type=text]"
    assert_selector "input[type=submit]"
  end

  test "creating a shortend URL" do
    visit root_url
    fill_in "universal_resource_identifier[long_url]", with: "https://getbootstrap.com/docs/4.0/components/forms"
    click_button "Short it!"
    assert_current_path root_path
  end

end
