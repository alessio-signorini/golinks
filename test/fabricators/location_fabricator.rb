Fabricator(:location) do
  transient :n_links, :n_ips

  organization
  name { Faker::Address.city + ' Office' }

  after_build do |location, transients|
    if n = transients[:n_links]
      location.links = Fabricate.build_times(n, :link)
    end

    if n = transients[:n_ips]
      location.network_addresses = Fabricate.build_times(n, :network_address)
    end
  end
end
