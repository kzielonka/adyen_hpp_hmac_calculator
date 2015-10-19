class AdyenHppHmacCalculator
  def initialize hmac_keys
    @hmac_key = hamc_key
  end

  def calculate params
    merchant_string = generate_merchant_string paramse
    hmac = hmac_calculator.calculate merchant_string
    base64_encode hmac
  end
  
  private

  def generate_merchant_string params
    MerchantStringGenerator.new(params).calculate
  end

  def hmac_calculator
    @hmac_calculator ||= HmacCalculator.new hmac_key
  end

  def base64_encode string
    Base64.strict_encode64 string
  end
end
