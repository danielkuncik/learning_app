require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:jonny)
    @other_user = users(:archer)
  end
  
  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                              section: "none",
                                              password:              "foo",
                                              password_confirmation: "bar"   } }
    assert_template 'users/edit'
  end
  
  test 'successful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Foo Bar"
    section = "violet"
    patch user_path(@user), params: { user: { name: name,
                                              section: section,
                                              password:              "",
                                              password_confirmation: ""  } }
    assert_not flash.empty?
    assert_redirected_to root_url
    @user.reload
    assert_equal name, @user.name
    assert_equal section, @user.section
  end
  
  test 'should redirect edit when not logged in' do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect upate when not logged in" do
    patch user_path(@user), params: {user: { name: @user.name,
                                             section: @user.section  }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                              section: @user.section  }}
    assert flash.empty?
    assert_redirected_to root_url
  end  

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end


end
