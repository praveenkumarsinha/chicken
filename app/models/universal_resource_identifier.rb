class UniversalResourceIdentifier < ApplicationRecord

  #==== Validations ===================================
  validates :long_url, presence: true, uniqueness: {case_sensitive: false}, http_url: true

  #==== Callbacks =====================================
  before_validation :downcase_long_url


  private

  def downcase_long_url
    self.long_url.try(:downcase!)
  end

end
