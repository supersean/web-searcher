require "test_helper"

class CrawlersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "i can access my crawlers" do
    user = users(:seansly)
    sign_in user

    get user_crawlers_path(user)

    assert_response :success
    assert_select ".crawlers"

    assert_select ".crawlers li", count: user.crawlers.count
  end
end
