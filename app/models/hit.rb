class Hit < ApplicationRecord

  #==== Validations ===================================
  validates :ip_address, :request_dump, presence: true
  validates :bot_hit, inclusion: {in: [true, false], message: 'should be either true or false'}

  #==== Associations ==================================
  belongs_to :universal_resource_identifier, inverse_of: :hits

end
