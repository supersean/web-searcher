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

  test "crawlers link is on user homepage" do
    sign_in users(:seansly)

    get '/'
    assert_select "a[href=?]", user_crawlers_path(users(:seansly).id)
  end
end
