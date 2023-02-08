require_relative './predicate'

class ValidUfeatured < ::Predicate
  def initialize(has_featured)
    @has_featured = has_featured
  end

  def validate(hentry)
    @has_featured.validate(hentry)

    raise InvalidMetadataError, 'Featured image does not start with https://firozansari.com/img/ or https://media.firozansari.com/' unless /^(https:\/\/www.firozansari.com\/img\/|https:\/\/media.firozansari.com\/)/.match?(hentry.featured)
  end
end
