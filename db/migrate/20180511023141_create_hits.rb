class CreateHits < ActiveRecord::Migration[5.2]
  def change
    create_table :hits do |t|
      t.references :universal_resource_identifier
      t.boolean :bot_hit
      t.string :ip_address
      t.string :http_referer
      t.float :latitude
      t.float :longitude
      t.text :request_dump
      t.timestamps
    end
  end
end
