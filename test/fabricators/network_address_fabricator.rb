Fabricator(:network_address) do
  location
  address { Faker::Internet.ip_v4_address }
end
