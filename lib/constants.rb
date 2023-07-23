ABRV_VALID_MAKE = %i{bmw vw}.freeze
NON_ABRV_VALID_MAKE = %i{audi mercedes}.freeze
VALID_MAKE = ABRV_VALID_MAKE.dup.append(*NON_ABRV_VALID_MAKE).freeze
VALID_MAKE_STR = VALID_MAKE.map { |make| make.to_s.upcase }
VALID_COLOUR = %i[white black red blue].freeze
VALID_COLOUR_STR = VALID_COLOUR.map { |colour| colour.to_s.upcase }
