class Api::V1::ShowsController < ApiController

  def index
    @shows = Show.all
    render json: @shows
  end

  def show
    @show = Show.find(params[:id])
    render json: @show
  end
end
