require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "login and browse site" do
    sign_in users(:seansly)

    get '/'
    assert_response :success
  end

  test "user not logged in is redirected" do
    get '/'
    assert_redirected_to "/users/sign_in"
  end

  test "navbar links (my profile, my crawlers, home) are all there" do
    sign_in users(:seansly)

    get '/'
    assert_select "a[href=?]", user_crawlers_path(users(:seansly))
    assert_select "a[href=?]", user_path(users(:seansly))
    assert_select "a[href=?]", root_path
  end
end
