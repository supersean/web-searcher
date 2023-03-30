require 'test_helper'

class CrawlerTest < ActiveSupport::TestCase
  test 'crawler needs a driver' do
    crawler = Crawler.new
    crawler.user = users(:seansly)
    assert_not crawler.save
  end

  test 'crawler saves with drivers' do
    crawler = Crawler.new
    crawler.user = users(:seansly)
    crawler.drivers.push Driver.first
    assert crawler.save
  end

  test 'crawler fails to save without a user' do
    crawler = Crawler.new
    crawler.drivers.push Driver.first
    assert_not crawler.save
  end

end
