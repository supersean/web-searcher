require "test_helper"

class CrawlResultsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "i can create a crawl result" do
    user = users(:seansly)
    sign_in user
    crawler = user.crawlers.first
    html = "this is some html"
    params = { crawl_result: { html:, crawler_id: crawler.id } }

    post(user_crawler_crawl_results_path(user, crawler), params:)

    assert_not_nil CrawlResult.find_by html:
  end
end
