require 'number_to_yen/converter'
require 'number_to_yen/version'

module NumberToYen
  module ToYen
    def to_yen(options = {})
      "#{to_ja(options)}円"
    end

    def to_ja(options = {})
      ::NumberToYen::Converter.new(self, options).convert
    end
  end
end
