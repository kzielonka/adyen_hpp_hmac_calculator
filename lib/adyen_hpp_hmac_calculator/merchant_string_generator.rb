module AdyenHppHmacCalculator::MerchantStringGenerator
  # Generates concatenated key/value paris
  #
  # @param params [Hash] key/value pairs to generate the signing string
  # @return [String] concatenated key/value pairs
  def self.generate params
    pairs = create_pairs params
    remove_unnecessary_keys pairs
    sort_key_value_pairs_by_key pairs
    delimit_pairs pairs
    concatenate_pairs pairs
  end

  private
  
  def self.create_pairs params
    params.map{ |key, value| [key.to_s.dup, value.to_s.dup] }
  end

  def self.remove_unnecessary_keys pairs
    pairs.reject! { |key, _| ignored_key? key }
  end

  def self.ignored_key? key
    key == 'sig' or key == 'merchantSig' or key.start_with? 'ignore.' 
  end

  def self.sort_key_value_pairs_by_key pairs
    pairs.sort_by!{ |key, _| key }
  end

  def self.delimit_pairs pairs
    pairs.each do |key, value|
      escape! key
      escape! value
    end
  end

  def self.escape! string
    string.gsub!('\\'){ '\\\\' }
    string.gsub!(':'){ '\:' }
  end

  def self.concatenate_pairs pairs
    keys = pairs.collect(&:first)
    values = pairs.collect(&:last)
    (keys + values).join(':')
  end
end
