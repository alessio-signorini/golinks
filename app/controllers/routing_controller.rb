class RoutingController < ActionController::API


  def api_error(status=500, message='Unknown error')
    render :status => status, :json => {
      :status => status, :message => message
    }
  end


  def redirect
    client = Client.find_by(:hostname => request.host)
      return api_error(401, 'Unknown domain') unless client

    unless client.authorized?(request.remote_addr)
      return api_error(401, 'Address not authorized')
    end

    redirect = client.redirects.find_by(:path => params[:path])
      return api_error(404, 'Path not found') unless redirect

    redirect_to redirect.url
  end


end
