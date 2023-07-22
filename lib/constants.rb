VALID_MAKE = %i{bmw audi vw mercedes}.freeze
VALID_COLOUR = %i[white black red blue].freeze

VALID_MAKE_STRINGS = VALID_MAKE.map { |make| make.to_s.upcase }
VALID_COLOUR_STRINGS = VALID_COLOUR.map { |colour| colour.to_s.upcase }
