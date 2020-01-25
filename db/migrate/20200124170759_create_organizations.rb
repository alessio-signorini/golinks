class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name, :null => false
      t.string :logo_url
      t.text :css

      t.timestamps
    end
  end
end
