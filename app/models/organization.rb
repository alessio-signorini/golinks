class Organization < ApplicationRecord
  has_many :locations
  has_many :network_addresses, :through => :locations
  has_many :links, :as => :owner
end
