class CreateRedirects < ActiveRecord::Migration[6.0]
  def change
    create_table :redirects do |t|
      t.references :client, null: false, foreign_key: true
      t.string :path
      t.string :url

      t.timestamps
    end
  end
end
