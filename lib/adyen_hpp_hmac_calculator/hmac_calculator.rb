require 'openssl'

class AdyenHppHmacCalculator::HmacCalculator
  DIGEST = OpenSSL::Digest.new('sha256')

  def initialize hmac_key
    @hmac_key_hex = string_to_hex hmac_key
  end

  def calculate data
    OpenSSL::HMAC.digest(DIGEST, @hmac_key_hex, data)
  end

  private

  def string_to_hex string
    Array(string).pack('H*')
  end
end
