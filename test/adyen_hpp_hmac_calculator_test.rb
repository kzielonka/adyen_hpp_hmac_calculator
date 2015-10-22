require 'minitest/autorun'
require 'adyen_hpp_hmac_calculator'

class AdyenHppHmacCalculatorTest < Minitest::Test
  def test_class_respond_to_calculate
    assert_respond_to AdyenHppHmacCalculator, :calculate
  end 

  def test_instance_respond_to_calculate
    hmac_key = 'key'
    calculator = AdyenHppHmacCalculator.new hmac_key
    assert_respond_to calculator, :calculate
  end

  def test_no_output
    assert_silent do
      AdyenHppHmacCalculator.calculate 'key', { param1: 'p1', param2: 'p2' }
    end
  end

  def test_generator_on_official_example
    # Data to this test was taken from example on site:
    # https://docs.adyen.com/pages/viewpage.action?pageId=5376964
    hmac_key = '4468D9782DEF54FCD706C9100C71EC43932B1EBC2ACF6BA0560C05AAA7550C48'
    params = {
      'merchantAccount': 'TestMerchant',
      'currencyCode': 'EUR',
      'paymentAmount': '199',
      'sessionValidity': '2015-06-25T10:31:06Z',
      'shipBeforeDate': '2015-07-01',
      'shopperLocale': 'en_GB',
      'merchantReference': 'SKINTEST-1435226439255',
      'skinCode': 'X7hsNDWp'
    }
    expected_merchant_signature = 'GJ1asjR5VmkvihDJxCd8yE2DGYOKwWwJCBiV3R51NFg='
    calculator_result = AdyenHppHmacCalculator.calculate hmac_key, params
    assert_equal expected_merchant_signature, calculator_result
  end
end
