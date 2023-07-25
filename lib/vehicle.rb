# frozen_string_literal: true

class Vehicle
  attr_reader :vrn, :make, :colour, :date_of_manufacture

  def initialize(vrn, make, colour, date_of_manufacture)
    @vrn = vrn
    @make = make
    @colour = colour
    @date_of_manufacture = date_of_manufacture
  end

  def mapped_vrn
    transformed_vrn = @vrn.upcase

    # Insert whitespace before the 4th index in the array of characters in the VRN if non-existing
    transformed_vrn.insert(4, "\s") unless transformed_vrn[4].match(/\s/)
    transformed_vrn
  end

  def mapped_make
    if ABRV_VALID_MAKE.any? { |s| s.to_s.casecmp(@make).zero? }
      @make.upcase
    else
      @make.capitalize
    end
  end

  def mapped_colour
    @colour.capitalize
  end

  def mapped_date_of_manufacture
    template = if @date_of_manufacture.match(%r{^\d{1,2}/\d{1,2}/\d{4}$})
                 '%d/%m/%Y'
               else
                 '%d-%m-%Y'
               end
    Date.strptime(@date_of_manufacture, template).strftime('%a, %d %B %Y')
  end
end
