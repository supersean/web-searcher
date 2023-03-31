require "test_helper"

class CrawlersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "i can access my crawlers" do
    user = users(:seansly)
    sign_in user

    get user_crawlers_path(user)

    assert_response :success
    assert_select ".crawlers"

    assert_select ".crawler", count: user.crawlers.count
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

  test "i can edit a crawler " do
    user = users(:seansly)
    sign_in user
    crawler = user.crawlers.first
    get edit_user_crawler_path(user, crawler)

    assert_response :success

    crawler.keywords = "something else"
    patch user_crawler_path(user, crawler),
          params: { crawler: { id: 3, keywords: crawler.keywords, drivers: crawler.drivers.map(&:id).take(1) } }
    assert_equal "something else", crawler.keywords
    assert_equal 1, crawler.drivers.count
    assert_not_equal crawler.id, 3
    assert_redirected_to user_crawlers_path(user)
  end

  test "i can delete a crawler" do
    user = users(:seansly)
    sign_in user
    crawler = user.crawlers.first

    crawler_count_before = user.crawlers.count
    delete user_crawler_path(user,crawler)
    assert_equal(crawler_count_before -1, user.crawlers.count)

    assert_redirected_to user_crawlers_path(user)
  end

end
