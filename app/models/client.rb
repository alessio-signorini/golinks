class Client < ApplicationRecord
  has_many :network_addresses
  has_many :redirects

  def authorized?(address)
    network_addresses.empty? || network_addresses.find_by(:address => address).present?
  end

end
