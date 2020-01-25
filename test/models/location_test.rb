require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  test 'links' do
    location = Fabricate(:location)

    loc_link = Fabricate(:link, :path => 'a', :owner => location, :url => 'good')
      assert_equal 1, Link.count

    org_link = Fabricate(:link, :path => 'b', :owner => location.organization)
      assert_equal 2, Link.count

    org_link2 = Fabricate(:link, :path => 'a', :owner => location.organization)
      assert_equal 3, Link.count

    assert_equal 2, location.links.count
    assert_equal 'good', location.links.find_by(:path => 'a').url
  end

end
