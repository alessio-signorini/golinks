class HomeController < ActionController::Base

  def index
    address = NetworkAddress.find_by(:address => request.remote_addr)
      head :not_found and return unless address

    @location     = address.location
    @organization = @location.organization
    @links        = @location.links
    @categories   = @links.map{|x| x.category}.uniq.sort

    render :index
  end

end
