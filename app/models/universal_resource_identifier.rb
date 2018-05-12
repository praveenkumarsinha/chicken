class UniversalResourceIdentifier < ApplicationRecord

  #==== Class variables ===============================
  @@sample_set ||= (['a'..'z', 0..9, 'A'..'Z'].collect {|x| x.to_a}.flatten)

  #==== Validations ===================================
  validates :long_url, presence: true, uniqueness: {case_sensitive: false}, http_url: true
  validates :short_url_id, presence: true, uniqueness: true, length: {within: 3..6}

  #==== Associations ==================================
  has_many :hits, -> {order('created_at desc')}, inverse_of: :universal_resource_identifier, dependent: :destroy

  #==== Callbacks =====================================
  before_validation :format_long_url
  before_validation :provision_short_url_id

  #==== Attributes accessors ==========================
  cattr_reader :sample_set

  def hit!(options)
    hit = self.hits.new(options)
    hit.save
  end

  private

  # Grabs a sample of alphanumeric characters and tries to find uniquness (via referencing db).
  # Attn: This is not full proof (but for POC can used)
  def provision_short_url_id
    return if self.short_url_id

    begin
      self.short_url_id = self.class.sample_set.sample(6).join
    end while (UniversalResourceIdentifier.where(short_url_id: self.short_url_id).count > 0)
  end

  def format_long_url
    self.long_url.try(:strip!)
    self.long_url.try(:downcase!)
  end

end
