# URL Interface to the Aggregation Engine:
#
# stitcherx.com/add_feed?feed=FEED_URL
#
class AggregatorsController < ApiController

  def engress
    if invalid_url? params[:feed]
      render json: {error: true}, status: 415
    else
      Aggregator.new.queue(feed: [params[:feed]])
      render json: {success: true}, status: 200
    end
  end

  private
  def invalid_url? url
    URI.parse(url).scheme.nil?
  end
end
