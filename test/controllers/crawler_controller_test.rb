require "test_helper"

class CrawlerControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "i can access my crawlers" do 
    user = users(:seansly)
    sign_in user

    get "/users/#{user.id}/crawlers/"

    assert_response :success
  end
end
