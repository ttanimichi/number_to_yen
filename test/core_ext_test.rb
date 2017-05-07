require 'test_helper'
require 'number_to_yen/core_ext'

class CoreExtTest < Minitest::Test
  def test_to_yen
    assert { 123456.to_yen == '12万3,456円' }
    assert { 123456.42.to_yen == '12万3,456円' }
  end

  def test_to_ja
    assert { 123456.to_ja == '12万3,456' }
  end
end
