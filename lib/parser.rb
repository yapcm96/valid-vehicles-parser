# frozen_string_literal: true

require_relative 'validator'
require_relative 'exceptions'
require_relative 'constants'
require_relative 'exception_collector'

class Parser
  def initialize
    @total_valid = 0
    @total_invalid = 0
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

  def map_vehicle_to_csv(vehicle:)
    [vehicle.mapped_vrn, vehicle.mapped_make, vehicle.mapped_colour, vehicle.mapped_date_of_manufacture]
  end

  def print_statistic
    puts "Total vehicles parsed: #{@total_valid + @total_invalid}"
    puts "Total valid vehicles: #{@total_valid}"
    puts "Total invalid vehicles: #{@total_invalid}"
  end
end
