class AddUserAgentRelatedFieldsInHit < ActiveRecord::Migration[5.2]

  def change
    add_column(:hits, :browser, :string, after: :longitude)
    add_column(:hits, :version, :string, after: :browser)
    add_column(:hits, :platform, :string, after: :version)
  end

end
