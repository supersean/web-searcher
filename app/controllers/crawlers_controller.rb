class CrawlersController < ApplicationController

  def index
    @display_name = current_user.name.nil? ? current_user.email : current_user.name
    @new_crawler = Crawler.new
  end

  def create
    new_crawler = Crawler.new(crawler_params)
    new_crawler.save

    redirect_to user_crawlers_path(current_user)
  end

  private

  def crawler_params
    crawler = params.require(:crawler).permit(:keywords, drivers: [])
    crawler[:drivers] = crawler[:drivers].reject(&:blank?).map { |id| Driver.find id }
    crawler[:user] = current_user
    crawler
  end
end
