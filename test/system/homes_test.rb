require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit root_url
    assert_selector "input[type=text]"
    assert_selector "input[type=submit]"
  end

  test "creating a shortend URL" do
    visit root_url
    fill_in "universal_resource_identifier[long_url]", with: "http://guides.rubyonrails.org/active_job_basics.html"
    click_button "Short it!"
    assert_current_path root_path
  end

  test "should get to original_url on visit by short_url_id" do
    visit visit_shortened_url(short_url_id: universal_resource_identifiers(:second_one).short_url_id)
    assert_current_path 'http://getbootstrap.com/docs/4.0/components/forms/'
  end

end
