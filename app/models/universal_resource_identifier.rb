class UniversalResourceIdentifier < ApplicationRecord

  #==== Validations ===================================
  validates :long_url, presence: true, uniqueness: {case_sensitive: false}, http_url: true
  validates :short_url_id, presence: true, uniqueness: true, length: {within: 3..6}

  #==== Callbacks =====================================
  before_validation :downcase_long_url


  private

  def downcase_long_url
    self.long_url.try(:downcase!)
  end

end
