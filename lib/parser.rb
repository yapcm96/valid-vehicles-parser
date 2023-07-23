require_relative 'validator.rb'
require_relative 'exceptions.rb'
require_relative 'constants.rb'
require_relative 'exception_collector.rb'

class Parser
  def initialize
    @total_valid = 0
    @total_invalid = 0
  end

  def validate_and_map_all_to_csv(vehicles:)
    @total_vehicles = vehicles.size

    CSV.open('./lib/assets/parsed_vehicles.csv', 'w') do |csv|
      # Write the header row
      csv << ['VRN', 'Make', 'Colour', 'Date of Manufacture']

      vehicles.select do |vehicle|
        # If validation passes, write each vehicle as a row in the CSV file
        csv << map_to_csv(vehicle:) if validate_vehicle(vehicle:)
      end
    end
  end

  def validate_vehicle(vehicle:)
    logger = ExceptionCollector.new
    logger.collect { Validator.validate_vrn(vrn: vehicle.vrn) }
    logger.collect { Validator.validate_make(make: vehicle.make) }
    logger.collect { Validator.validate_colour(colour: vehicle.colour) }
    logger.collect { Validator.validate_date_of_manufacture(date_of_manufacture: vehicle.date_of_manufacture) }

    begin
      raise ValidationError, logger.output_error_list unless logger.errors.empty?

      @total_valid += 1
      puts "Vehicle with VRN of '#{vehicle.vrn}' has been successfully validated"
      true
    rescue ValidationError => e
      # Vehicle which failed the parser validation and cannot be stored is displayed and the program continues
      @total_invalid += 1
      puts "Failed to validate vehicle with VRN of '#{vehicle.vrn}':#{e}"
      false
    end
  end

  def map_to_csv(vehicle:)
    [vehicle.mapped_vrn, vehicle.mapped_make, vehicle.mapped_colour, vehicle.mapped_date_of_manufacture]
  end

  def print_statistic
    puts "Total vehicles parsed: #{@total_vehicles}"
    puts "Total valid vehicles: #{@total_valid}"
    puts "Total invalid vehicles: #{@total_invalid}"
  end
end
