class AddUniqueIndexToShortUrlId < ActiveRecord::Migration[5.2]
  def change
    add_index :universal_resource_identifiers, :short_url_id, unique: true
    add_index :universal_resource_identifiers, :long_url, unique: true
  end
end
