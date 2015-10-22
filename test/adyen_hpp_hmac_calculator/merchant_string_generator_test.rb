require 'minitest/autorun'
require 'adyen_hpp_hmac_calculator'

class MerchantStringGeneratorTest < Minitest::Test
  def setup
    @simple_params = { 'key': 'value' }
    @generator = AdyenHppHmacCalculator::MerchantStringGenerator
  end

  def test_instance_respond_generate
    assert_respond_to @generator, :generate
  end  

  def test_that_generator_does_not_change_params
    params = @simple_params
    params_clone = params.clone
    @generator.generate params
    assert_equal params_clone, params
  end

  def test_sorting_keys
    params = { b: 'x', c: 'x', a: 'x' }
    result = @generator.generate params
    expected_result = 'a:b:c:x:x:x'
    assert_equal expected_result, result 
  end

  def test_escaping_backslashes
    params = { 'aa\\aa' => 'bb\\bb' }
    result = @generator.generate params
    expected_result = 'aa\\\\aa:bb\\\\bb'
    assert_equal expected_result, result 
  end

  def test_escaping_colons
    params = { 'aa:aa' => 'bb:bb' }
    result = @generator.generate params
    expected_result = 'aa\\:aa:bb\\:bb'
    assert_equal expected_result, result 
  end

  def test_removing_sig
    params = { param: 'value', sig: '1234' }
    result = @generator.generate params
    expected_result = 'param:value'
    assert_equal expected_result, result 
  end

  def test_removing_merchant_sig
    params = { 'param' => 'value', 'merchantSig' => '5678' }
    result = @generator.generate params
    expected_result = 'param:value'
    assert_equal expected_result, result 
  end

  def test_removing_params_with_ignore_prefix
    params = {
      'key_1' => 'value_1',
      'ignore.key_2' => 'value_2',
      'ignore.key_3' => 'value_3'
    }
    result = @generator.generate params
    expected_result = 'key_1:value_1'
    assert_equal expected_result, result 
  end
end
