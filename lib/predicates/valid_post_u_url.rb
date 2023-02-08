require_relative './predicate'
require_relative '../invalid_metadata_error'

class ValidPostUUrl < Predicate
  def validate(hcard)
    raise InvalidMetadataError, 'Post URL does not match site URL' unless /^https:\/\/www.firozansari.com\/posts\//.match? hcard.url
  end
end
