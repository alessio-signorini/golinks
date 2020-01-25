Fabricator(:link) do
  owner         { Fabricate(:organization) }
  description   { Faker::Marketing.buzzwords }
  path          { Faker::Company.profession }
  url           { Faker::Internet.url(host: 'example.com') }
  category      { Faker::Verb.base }
end
