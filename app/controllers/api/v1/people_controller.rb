class Api::V1::PeopleController < ApiController

  def guests
    @guests = Episode.find(params[:episode_id]).guests
    render json: @guests
  end

  def guest
    @guest = Guest.find(params[:guest_id])
    render json: @guest
  end

  def hosts
    @hosts = Show.find(params[:show_id]).hosts
    render json: @hosts
  end

  def host
    @host = Host.find(params[:host_id])
    render json: @host
  end
end
