class Location < ApplicationRecord
  belongs_to :organization
  has_many :network_addresses
  has_many :links, :as => :owner

  # Merge Location links on top of Organization Links
  def links
    super.or(organization.links.where.not(:path => super.pluck(:path)))
  end

end
