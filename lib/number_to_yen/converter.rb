module NumberToYen
  class Converter
    def initialize(number, options = {})
      unless number.respond_to?(:to_i)
        fail ArgumentError, "You must pass something that responds to `to_i`: #{number.inspect}"
      end

      @number = number.to_i
      @options = _symbolize_keys(options)
    end

    def convert
      return '0' if @number.zero?

      units.map.with_index { |unit, index|
        unit_number =
          if index.zero?
            @number / unit[:value]
          else
            @number / unit[:value] % basic_unit
          end

        unless unit_number.zero?
          s = unit_number.to_s
          (1..s.length).select {|i| i % 4 == 0 }.each {|i| s.insert(-i, ',') }
          "#{s}#{unit[:name]}"
        end
      }.join.sub(/\A[0,]+/, '')
    end

    private

    def units
      @units ||= [
        { value: basic_unit ** 4, name: '京' },
        { value: basic_unit ** 3, name: '兆' },
        { value: basic_unit ** 2, name: '億' },
        { value: basic_unit ** 1, name: '万' },
        { value: basic_unit ** 0, name: '' }
      ]
    end

    def basic_unit
      10_000
    end

    # TODO: fake implementation
    def _symbolize_keys(options)
      options
    end
  end
end
