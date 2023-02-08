require_relative './predicate'
require_relative '../invalid_metadata_error'

class ValidUUrl < Predicate
  def validate(hcard)
    raise InvalidMetadataError, 'URL is not set' unless hcard.respond_to?(:url)
    url = hcard.url
    raise InvalidMetadataError, 'URL is not equal to https://firozansari.com' unless 'https://firozansari.com' == url ||
      'https://firozansari.com/' == url
  end
end
