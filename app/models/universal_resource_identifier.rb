class UniversalResourceIdentifier < ApplicationRecord

  #==== Validations ===================================
  validates :long_url, presence: true, uniqueness: {case_sensitive: false}, http_url: true

end
