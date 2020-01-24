class AddReverseNetworkAddressIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :network_addresses, :address
  end
end
