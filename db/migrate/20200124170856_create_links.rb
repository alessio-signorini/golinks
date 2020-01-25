class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.references :owner, polymorphic: true, null: false
      t.string :description
      t.string :path, :null => false
      t.string :url, :null => false
      t.string :category

      t.timestamps
    end

    add_index :links, [:owner, :path]
  end
end
