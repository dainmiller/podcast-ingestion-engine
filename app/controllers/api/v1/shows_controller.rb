# TODO: Use respond_with / respond_to :json
# TODO: ^ This allows us to use jbuilder views
class ShowsController < ApiController

  def index
    @shows = Show.all
    render json: @shows
  end

  def show
    @show = Show.find(params[:id])
    render json: @show
  end
end
