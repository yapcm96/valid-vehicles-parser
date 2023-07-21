require 'active_support/core_ext/array'
require 'csv'
require 'json'
require 'pry'

dataset = CSV.read("./lib/assets/vehicles.csv")
dataset.shift # removes headers row
binding.pry
# new_vehicles = dataset.collect { |row| Vehicle.new *row}


