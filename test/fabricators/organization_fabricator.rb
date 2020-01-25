Fabricator(:organization) do
  transient :full

  name      { Faker::Company.name }
  logo_url  { Faker::Company.logo }

  after_build do |organization, transients|
    if transients[:full]
      organization.locations << Fabricate.build_times(2, :location,
        :n_links => 5, :n_ips => 2
      )
    end
  end
end
