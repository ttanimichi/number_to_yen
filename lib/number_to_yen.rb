require 'number_to_yen/converter'
require 'number_to_yen/version'

module NumberToYen
  def number_to_yen(number, options = {})
    "#{number_to_ja(number, options)}円"
  end

  def number_to_ja(number, options = {})
    Converter.new(number, options).convert
  end
end
