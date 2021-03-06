require 'openssl'

class AdyenHppHmacCalculator::HmacCalculator
  DIGEST = OpenSSL::Digest.new('sha256')

  def initialize hmac_key
    @hmac_key_hex = string_to_hex hmac_key
  end

  # Calculates HMAC SHA-256 from string 
  #
  # @param string [String] string to calculate HMAC SHA-256
  # @return [String] HMAC SHA-256 string
  def calculate string
    OpenSSL::HMAC.digest(DIGEST, @hmac_key_hex, string)
  end

  private

  def string_to_hex string
    Array(string).pack('H*')
  end
end
