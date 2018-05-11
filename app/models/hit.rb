class Hit < ApplicationRecord

  #==== Associations ==================================
  belongs_to :universal_resource_identifier, inverse_of: :hits

end
