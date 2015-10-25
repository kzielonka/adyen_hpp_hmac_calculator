require 'base64'

# Calculates merchant signature for Adyen payment serivce (http://www.adyen.com).
# It is based on documentation from:
# https://docs.adyen.com/pages/viewpage.action?pageId=5376964
#
# @example Calculating merchant signature using AdyenHppHmacCalculator::calculate:
#   hmac_key = "4468D9782DEF54FCD706C9100C71EC43932B1EBC2ACF6BA0560C05AAA7550C48"
#   params = { 
#     "merchantAccount"   => "TestMerchant",
#     "currencyCode"      => "EUR",
#     "paymentAmount"     => "199",
#     "sessionValidity"   => "2015-06-25T10:31:06Z",
#     "shipBeforeDate"    => "2015-07-01",
#     "shopperLocale"     => "en_GB",
#     "merchantReference" => "SKINTEST-1435226439255",
#     "skinCode"          => "X7hsNDWp"
#   }
#   AdyenHppHmacCalculator.calculate(hamc_key, params) #=> "GJ1asjR5VmkvihDJxCd8yE2DGYOKwWwJCBiV3R51NFg="
class AdyenHppHmacCalculator
  def initialize hmac_key
    @hmac_key = hmac_key.clone.freeze
  end

  # Calculates merchant signature for specified params using hmac key specified on initialization
  #
  # @param params [Hash] key/value pairs to calculate merchant signature
  # @return [String] HMAC SHA-256 Base64 signature encoded
  def calculate params
    merchant_string = generate_merchant_string params
    hmac = hmac_calculator.calculate merchant_string
    base64_encode hmac
  end

  # Calculates merchant signatre for specified hmac key and params
  # https://docs.adyen.com/pages/viewpage.action?pageId=5376964
  #
  # @param hmac_key [String] key for HMAC algorithm
  # @param params [Hash] key/value pairs to calculate merchant signature
  # @return [String] HMAC SHA-256 Base64 signature encoded
  def self.calculate hmac_key, params
    self.new(hmac_key).calculate params
  end
  
  private

  def generate_merchant_string params
    MerchantStringGenerator.generate params
  end

  def hmac_calculator
    @hmac_calculator ||= HmacCalculator.new @hmac_key
  end

  def base64_encode string
    Base64.strict_encode64 string
  end
end

require 'adyen_hpp_hmac_calculator/merchant_string_generator'
require 'adyen_hpp_hmac_calculator/hmac_calculator'
