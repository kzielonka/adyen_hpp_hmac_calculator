# Adyen HPP HMAC Calculator
AdyenHppHmacCalculator is a gem to calculate Adyen (http://www.adyen.com) Hosted Payment Pages HMAC (SHA-256).
It is implementation of process described on next link:
https://docs.adyen.com/display/TD/HPP+HMAC+calculation

## Instalation
Install **AdyenHppHmacCalculator** using gem command:

```bash
    gem install adyen_hpp_hmac_calculator
```

or add it to your Gemfile:

```ruby
    gem 'adyen_hpp_hmac_calculator'
```

## Usage
You can calculate merchant signature on two ways.
The first one is by using class method **AdyenHppHmacCalculator::caluclate**:

```ruby
    hmac_key = "4468D9782DEF54FCD706C9100C71EC43932B1EBC2ACF6BA0560C05AAA7550C48"
    params = { 
      "merchantAccount"   => "TestMerchant",
      "currencyCode"      => "EUR",
      "paymentAmount"     => "199",
      "sessionValidity"   => "2015-06-25T10:31:06Z",
      "shipBeforeDate"    => "2015-07-01",
      "shopperLocale"     => "en_GB",
      "merchantReference" => "SKINTEST-1435226439255",
      "skinCode"          => "X7hsNDWp"
    }
    AdyenHppHmacCalculator.calculate(hamc_key, params) #=> "GJ1asjR5VmkvihDJxCd8yE2DGYOKwWwJCBiV3R51NFg="
```

The second one is by creating instance of **AdyenHppHmacClaculator** initialized with **hmac_key**.
To calculate merchant signature use **AdyenHppHmacCalculator#calculate** like below:

```ruby
    hmac_key = "4468D9782DEF54FCD706C9100C71EC43932B1EBC2ACF6BA0560C05AAA7550C48"
    adyen_hpp_hmac_calculator = AdyenHppHmacCalculator.new(hamc_key)
     
    params = { 
      "merchantAccount"   => "TestMerchant",
      "currencyCode"      => "EUR",
      "paymentAmount"     => "199",
      "sessionValidity"   => "2015-06-25T10:31:06Z",
      "shipBeforeDate"    => "2015-07-01",
      "shopperLocale"     => "en_GB",
      "merchantReference" => "SKINTEST-1435226439255",
      "skinCode"          => "X7hsNDWp"
    }
    adyen_hpp_hmac_calculator.calculate(params) #=> "GJ1asjR5VmkvihDJxCd8yE2DGYOKwWwJCBiV3R51NFg="
```
