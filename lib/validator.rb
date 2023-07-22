module Validator
  def self.validate_vrn(vrn:)
    unless vrn.match(/^[a-zA-Z]{2}\d{2}\s?[a-zA-Z]{3}$/)
      raise ValidationError.new, "VRN is invalid due to not following 'LLDD LLL' format, where L is a letter and D is a number (spacing is optional and case is insensitive)."
    end
  end

  def self.validate_make(make:)
    unless VALID_MAKE.include? make.symbolize
      raise ValidationError.new, "Vehicle has make of '#{make}' which is not part of the parser's accepted vehicle makes."
    end
  end

  def self.validate_colour(colour:)
    unless VALID_COLOUR.include? colour.symbolize
      raise ValidationError.new, "Vehicle has colour of '#{colour}' which is not part of the parser's accepted vehicle colours."
    end
  end

  # def self.validate_date_of_manufacture(date_of_manufacture:)
  #   binding.pry
  #
  #   unless date_of_manufacture.match(/^$/)
  #     raise ValidationError.new, "Vehicle has colour of '#{colour}' which is not part of the parser's accepted vehicle colours."
  #   end
  # end
end
