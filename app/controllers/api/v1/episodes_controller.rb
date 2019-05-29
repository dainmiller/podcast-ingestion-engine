class Api::V1::EpisodesController < ApiController

  def index
    @episodes = Show.find(params[:show_id]).episodes
    render json: @episodes
  end

  def show
    @episode = Episode.find(params[:id])
    render json: @episode
  end

end
