VALID_MAKE = %i{bmw audi vw mercedes}.freeze
VALID_COLOUR = %i[white black red blue].freeze

VALID_MAKE_STR = VALID_MAKE.map { |make| make.to_s.upcase }
VALID_COLOUR_STR = VALID_COLOUR.map { |colour| colour.to_s.upcase }
