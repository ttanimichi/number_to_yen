require 'test_helper'
require 'number_to_yen'

class NumberToYenTest < Minitest::Test
  include NumberToYen

  def test_number_to_yen
    assert { number_to_yen(123) == '123円' }
    assert { number_to_yen(1234) == '1,234円' }
    assert { number_to_yen(123456) == '12万3,456円' }
    assert { number_to_yen(1234567890) == '12億3,456万7,890円' }

    assert { number_to_yen(123456.00) == '12万3,456円' }
    assert { number_to_yen(123456.42) == '12万3,456円' }

    assert { number_to_yen(120000) == '12万円' }
    assert { number_to_yen(1234560000) == '12億3,456万円' }
    assert { number_to_yen(1200007890) == '12億7,890円' }
    assert { number_to_yen(1200000000) == '12億円' }

    assert { number_to_yen(12345678901234567890) == '1,234京5,678兆9,012億3,456万7,890円' }
    assert { number_to_yen(1234567890123456789012) == '123,456京7,890兆1,234億5,678万9,012円' }

    assert { number_to_yen(0) == '0円' }

    assert_raises(ArgumentError) { number_to_yen(:invalid_argument) }
  end

  def test_number_to_ja
    assert { number_to_ja(123456) == '12万3,456' }
  end

  def test_that_it_has_a_version_number
    refute_nil ::NumberToYen::VERSION
  end
end
