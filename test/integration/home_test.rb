require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest

  setup do
    host! 'go'

    @location = Fabricate(:location, :n_links => 2)
    @network_address = Fabricate(:network_address, :location => @location, :address => '127.0.0.1')
  end

  test 'unknown address' do
    @network_address.delete
    get '/test'
    assert_response 401
  end

  test 'exists' do
    get '/'
    assert_response 200

    @location.links.each do |link|
      assert_match "<b>go/#{link.path}</b>", response.parsed_body
    end

    assert_match "<img src='#{@location.organization.logo_url}' id='organization_logo'>", response.parsed_body
  end

end
