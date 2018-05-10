class HttpUrlValidator < ActiveModel::EachValidator

  def self.valid_http_url?(value)
    _uri = URI.parse(value)
    (_uri.is_a?(URI::HTTP) and !_uri.host.nil?)
  rescue URI::InvalidURIError
    false
  end

  def validate_each(record, attribute, value)
    unless value.present? and self.class.valid_http_url?(value)
      record.errors.add(attribute, 'is not a valid http url')
    end
  end

end