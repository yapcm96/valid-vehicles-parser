# Valid Vehicles Parser

This project simulates a simple parser that parses a CSV file containing vehicles with properties of `vrn`, `make`, `colour` and `dateOfManufacture`.

Vehicles that have passed validation on all properties are then stored in a proper format in a new CSV file.

## Running the project

Prerequisite:
1. Ruby 3.2 and above. Installation guides for MacOS and Windows can be widely found online.

To run this project, run the following commands in the terminal:
1. `bundle install`. This will install all the gems listed in the Gemfile with the versions specified in the Gemfile.lock
2. `ruby app.rb` to run the app and see the parsing process.

Dataset of sample vehicles is located in
`valid-vehicles-parser/lib/assets/vehicles.csv`. Therefore, new vehicle samples can be added or updated in here by
following the CSV format.

## What happens when the parser is run

When running the parser, the validation result of each vehicle from the sample dataset will be printed out on the terminal.

The
parsing process will display vehicles that has passed the validation and vehicles that fail the validation checks (i.e. invalid vrn,
invalid vehicle make, invalid vehicle colour and/or invalid date of manufacture) and display a list of reasons for the failed validation of that particular vehicle.

The parsing process will also store each valid vehicle in an appropriate format into a new CSV file located in `valid-vehicles-parser/lib/assets/parsed_vehicles.csv`.

Once the parsing process is complete, a summary of the number of total vehicles parsed, total valid vehicles and total invalid vehicles will be displayed.
