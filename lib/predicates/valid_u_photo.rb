require_relative './predicate'
require_relative '../invalid_metadata_error'

class ValidUPhoto < Predicate
  def validate(hcard)
    raise InvalidMetadataError, 'Photo is not set' unless hcard.respond_to?(:photo)
    photo = hcard.photo
    raise InvalidMetadataError, 'Photo is not equal to https://firozansari.com/img/profile.jpg' unless 'https://firozansari.com/img/profile.jpg' == photo
  end
end

