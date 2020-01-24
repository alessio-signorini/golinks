class RoutingController < ActionController::API


  def api_error(status=500, message='Unknown error')
    render :status => status, :json => {
      :status => status, :message => message
    }
  end


  def redirect
    address = NetworkAddress.find_by(:address => request.remote_addr)
      return api_error(401, 'Address unknown') unless address

    redirect = address.client.redirects.find_by(:path => params[:path])
      return api_error(404, 'Path not found') unless redirect

    redirect_to redirect.url
  end


end
