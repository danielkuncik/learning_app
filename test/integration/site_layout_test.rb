require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path, count: 2
    assert_select "a[href=?]", signup_path, count: 1
    get signup_path
    assert_select "title", full_title("Create User")
  end

end
