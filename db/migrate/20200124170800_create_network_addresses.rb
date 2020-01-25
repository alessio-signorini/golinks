class CreateNetworkAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :network_addresses do |t|
      t.references :location, null: false, foreign_key: true
      t.string :name
      t.string :address, :null => false

      t.timestamps
    end

    add_index :network_addresses, :address
  end
end
