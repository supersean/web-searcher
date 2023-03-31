class CrawlersController < ApplicationController

  def index
    @display_name = current_user.name.nil? ? current_user.email : current_user.name
    @crawler = Crawler.new
  end

  def create
    new_crawler = Crawler.new(new_crawler_params)
    new_crawler.save

    redirect_to user_crawlers_path(current_user)
  end

  def edit
    @crawler = Crawler.find params[:id]
  end

  def update
    crawler = Crawler.find params[:id]
    crawler.update(crawler_params)

    redirect_to user_crawlers_path(current_user)
  end

  def destroy
    Crawler.delete params[:id]
    redirect_to user_crawlers_path(current_user)
  end

  private

  def crawler_params
    crawler = params.require(:crawler).permit(:keywords, drivers: [])
    crawler[:drivers] = crawler[:drivers].reject(&:blank?).map { |id| Driver.find id }
    crawler
  end

  def new_crawler_params
    crawler = crawler_params
    crawler[:user] = current_user
    crawler
  end

end
