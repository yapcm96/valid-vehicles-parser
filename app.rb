require 'active_support/core_ext/array'
require 'csv'
require 'json'
require 'pry'
require 'simple_symbolize'
# require 'active_model'
# require 'active_model/validations/date_validator'
require_relative './lib/parser.rb'
require_relative './lib/vehicle.rb'

SimpleSymbolize.translate { |trans| trans.handle_camel_case = false }


dataset = CSV.read("./lib/assets/vehicles.csv")
dataset.shift # removes headers row

new_vehicles = dataset.collect { |row| Vehicle.new *row}

parser = Parser.new
puts "--- Begin parsing dataset ---"
parser.parse_all(vehicles: new_vehicles)
puts "--- Parsing process complete ---"
# parser.generate_report

