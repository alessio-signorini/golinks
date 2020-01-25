require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  test 'links' do
    location = Fabricate(:location, :n_links => 1)
      assert_equal 1, Link.count

    org_link = Fabricate(:link, :owner => location.organization)
      assert_equal 2, Link.count

    link = location.links.first

    org_link2 = link.dup.update(:url => 'http://bad', :owner => location.organization)
      assert_equal 3, Link.count

    assert_equal 2, location.links.count
    assert_equal link.url, location.links.find_by(:path => link.path).url
  end

end
