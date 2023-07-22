class Vehicle
  attr_reader :vrn, :make, :colour, :date_of_manufacture

  def initialize(vrn, make, colour, date_of_manufacture)
    @vrn = vrn
    @make = make
    @colour = colour
    @date_of_manufacture = date_of_manufacture
  end
end