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

  test "i can create a crawler" do
    user = users(:seansly)
    sign_in user
    get new_user_crawler_path(user)
    assert_response :success

    keywords = "ABC"
    drivers = Driver.all.collect(&:id)

    post user_crawlers_path(user), params: { crawler: { keywords:, drivers: } }
    assert_redirected_to user_crawlers_path(user)

    assert_not_nil user.crawlers.find_by(keywords:)
  end
  
end
