class RenameShortUrltoShortUrlId < ActiveRecord::Migration[5.2]
  def change
    rename_column :universal_resource_identifiers, :short_url, :short_url_id
  end
end
