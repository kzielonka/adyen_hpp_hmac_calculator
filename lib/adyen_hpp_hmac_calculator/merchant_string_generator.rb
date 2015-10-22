class AdyenHppHmacCalculator::MerchantStringGenerator
  def initialize params
    @params = params
  end

  def generate
    pairs = create_pairs 
    remove_unnecessary_keys pairs
    sort_key_value_pairs_by_key pairs
    delimit_pairs pairs
    concatenate_pairs pairs
  end

  private
  
  def create_pairs
    @params.map{ |key, value| [key.to_s, value.to_s] }
  end

  def remove_unnecessary_keys pairs
    pairs.reject! do |key, _|
      key == 'sig' or key == 'merchantSig' or key.start_with? 'ignore.' 
    end
  end

  def sort_key_value_pairs_by_key pairs
    pairs.sort_by!{ |key, _| key }
  end

  def delimit_pairs pairs
    pairs.map!{ |key, value| [escape(key), escape(value)] }
  end

  def escape string
    string.gsub('\\', '\\\\').gsub(':', '\:')
  end

  def concatenate_pairs pairs
    keys = pairs.collect(&:first)
    values = pairs.collect(&:last)
    (keys + values).join(':')
  end
end
