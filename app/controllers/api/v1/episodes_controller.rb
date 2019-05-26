# TODO: Use respond_with / respond_to :json
# TODO: ^ This allows us to use jbuilder views
class EpisodesController < ApiController

  def index
    @episodes = Show.find(params[:show_id]).episodes
    render json: @episodes
  end

end
