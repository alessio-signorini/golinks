class HomeController < ActionController::Base

  def index
    address = NetworkAddress.find_by(:address => request.remote_addr)
      render :status => :not_found unless address

    @location     = address.location
    @organization = @location.organization
    @links        = @location.links

    render :index
  end

end
