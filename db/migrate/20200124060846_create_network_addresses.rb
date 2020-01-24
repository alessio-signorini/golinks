class CreateNetworkAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :network_addresses do |t|
      t.references :client, null: false, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
