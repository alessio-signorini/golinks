require 'test_helper'

class RoutingTest < ActionDispatch::IntegrationTest

  setup do
    @location = Fabricate(:location, :n_links => 1)
    @network_address = Fabricate(:network_address, :location => @location, :address => '127.0.0.1')
  end

  test 'unknown address' do
    @network_address.delete
    get '/test'
    assert_response 401
  end

  test 'unknown path' do
    get '/test'
    assert_response 404
  end

  test 'organization path' do
    @location.organization.links << Link.new(:path => 'test', :url => 'http://organization.link')

    get '/test'
    assert_redirected_to 'http://organization.link'
  end

  test 'location path' do
    link = Fabricate(:link, :owner => @location)

    get '/' + link.path
    assert_redirected_to link.url
  end

  test 'location path when organization has same path' do
    link1 = Fabricate(:link, :owner => @location.organization)
    link2 = Fabricate(:link, :owner => @location, :path => link1.path)
      assert_not_equal link1.url, link2.url

    get '/' + link1.path
    assert_redirected_to link2.url
  end


end
