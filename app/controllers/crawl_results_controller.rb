class CrawlResultsController < ApplicationController

  def create
    CrawlResult.create(crawl_result_params)
  end

  private

  def crawl_result_params
    params.require(:crawl_result).permit(:html, :crawler_id)
  end
end
