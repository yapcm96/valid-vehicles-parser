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

new_vehicles = dataset.collect { |row| Vehicle.new *row}

parser = Parser.new
puts '--- Begin parsing dataset ---'
parser.validate_and_map_all_to_csv(vehicles: new_vehicles)
puts '--- Parsing process complete ---'
parser.print_statistic
