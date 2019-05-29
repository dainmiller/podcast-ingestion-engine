class NetworksController < ApiController
  
  def index
    @networks = Network.all
    render json: @networks
  end

  def show
    @network = Network.find(params[:id])
    render json: @network
  end
end
