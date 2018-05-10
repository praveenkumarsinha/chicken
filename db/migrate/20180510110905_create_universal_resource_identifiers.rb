class CreateUniversalResourceIdentifiers < ActiveRecord::Migration[5.2]
  def change
    create_table :universal_resource_identifiers do |t|
      t.text :long_url, length: 500
      t.string :short_url
      t.timestamps
    end
  end
end
