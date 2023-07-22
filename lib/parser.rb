require_relative 'validator.rb'
require_relative 'exceptions.rb'
require_relative 'constants.rb'

class Parser
  def initialize
    @valid_vehicles = []
    @total_valid = 0
    @total_invalid = 0
  end

  def parse(vehicle:)
    begin
      Validator.validate_vrn(vrn: vehicle.vrn)
      Validator.validate_make(make: vehicle.make)
      Validator.validate_colour(colour: vehicle.colour)
      Validator.validate_date_of_manufacture(date_of_manufacture: vehicle.date_of_manufacture)

      @valid_vehicles << vehicle
      @total_valid += 1
      puts "Vehicle with VRN of '#{vehicle.vrn}' has been successfully stored"
    rescue ValidationError => e
      # Vehicle which failed the parser validation and cannot be stored is displayed and the program continues
      puts "Failed to store vehicle with VRN of '#{vehicle.vrn}': #{e}"
      @total_invalid += 1
    end
  end

  def parse_all(vehicles:)
    vehicles.select { |vehicle| parse(vehicle:) }
  end
end
