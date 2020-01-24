class AddUsefulIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :clients, :hostname
    add_index :network_addresses, [:client_id, :address]
    add_index :redirects, [:client_id, :path]
  end
end
