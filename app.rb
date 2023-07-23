# frozen_string_literal: true

require 'active_support/core_ext/array'
require 'csv'
require 'json'
require 'pry'
require 'simple_symbolize'
require_relative './lib/parser.rb'
require_relative './lib/vehicle.rb'

SimpleSymbolize.translate { |trans| trans.handle_camel_case = false }

dataset = CSV.read('./lib/assets/vehicles.csv')
dataset.shift # removes headers row
parser = Parser.new

puts '--- Begin parsing dataset ---'

# Creates a new CSV file
CSV.open('./lib/assets/parsed_vehicles.csv', 'w') do |csv|
  # Write the header row
  csv << ['VRN', 'Make', 'Colour', 'Date of Manufacture']

  # Iterate through the sample vehicles dataset
  dataset.collect do |row|
    # Creates vehicle object from row in the sample vehicles dataset
    vehicle = Vehicle.new(*row)

    # Performs validation on the vehicle object
    if parser.validate_vehicle(vehicle:)
      # Maps vehicle object into the correct format and inserts it as a row in the new CSV file
      csv << parser.map_vehicle_to_csv(vehicle:)
    end
  end
end

puts '--- Parsing process complete ---'

parser.print_statistic
