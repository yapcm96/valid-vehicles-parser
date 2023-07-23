# frozen_string_literal: true

module Validator
  def self.validate_vrn(vrn:)
    return if vrn.match(/^[a-zA-Z]{2}\d{2}\s?[a-zA-Z]{3}$/)

    raise ValidationError.new,
          "VRN is invalid due to not following 'LLDD LLL' format, where L is a letter and D is a number (spacing is optional and case is insensitive)."
  end

  def self.validate_make(make:)
    return if VALID_MAKE.include? make.symbolize

    raise ValidationError.new,
          "Vehicle has make of '#{make}' which is not part of the parser's accepted vehicle makes (i.e. one of #{VALID_MAKE_STR})."
  end

  def self.validate_colour(colour:)
    return if VALID_COLOUR.include? colour.symbolize

    raise ValidationError.new,
          "Vehicle has colour of '#{colour}' which is not part of the parser's accepted vehicle colours (i.e. one of #{VALID_COLOUR_STR})."
  end

  def self.validate_date_of_manufacture(date_of_manufacture:)
    # Validates format of date
    raise InvalidDateFormat unless date_of_manufacture.match(%r{^\d{1,2}[/-]\d{1,2}[/-]\d{4}$})

    # Choose template for parsing date string into date object
    template = if date_of_manufacture.match(%r{^\d{1,2}/\d{1,2}/\d{4}$})
                 '%d/%m/%Y'
               else
                 '%d-%m-%Y'
               end

    # Parse date string into date object
    parsed_date = Date.strptime(date_of_manufacture, template)

    # Validates date object is in valid range i.e. 1900 to current date
    raise InvalidDateRange unless parsed_date >= Date.new(1900, 1, 1) && parsed_date <= Date.today
  rescue InvalidDateFormat, InvalidDateRange
    raise ValidationError.new,
          "Vehicle has date of manufacture of '#{date_of_manufacture}' which is an invalid date. Valid date must follow the format 'dd/mm/yyyy' or 'dd-mm-yyyy' (zero padding is optional), must not be in the future and must be between the year 1900 to present."
  end
end
