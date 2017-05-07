require 'number_to_yen/to_yen'

Numeric.class_eval do
  include ::NumberToYen::ToYen
end
