class Address < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    def address
        [number_and_street, city, postal_code, country].compact.join( ", ")
    end

    def address_changed?
        number_and_street_changed? || city_changed? || postal_code_changed? || country_changed?
    end
end
