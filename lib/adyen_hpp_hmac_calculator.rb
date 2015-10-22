require 'base64'

class AdyenHppHmacCalculator
  def initialize hmac_key
    @hmac_key = hmac_key.dup
  end

  def calculate params
    merchant_string = generate_merchant_string params
    hmac = hmac_calculator.calculate merchant_string
    base64_encode hmac
  end

  def self.calculate hmac_key, params
    self.new(hmac_key).calculate params
  end
  
  private

  def generate_merchant_string params
    MerchantStringGenerator.new(params).generate
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
