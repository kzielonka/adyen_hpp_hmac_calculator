Gem::Specification.new do |s|
  s.name        = 'adyen_hpp_hmac_calculator'
  s.version     = '0.0.2'
  s.date        = '2015-10-07'
  s.summary     = 'Adyen HPP HMAC calculator'
  s.description = "Merchant signature calculator for Adyen (https://www.adyen.com) payments service. " +
                  "It is implementation of HPP HMAC (SHA-256) algorithm from Adyen documentation " +
                  "(https://docs.adyen.com/display/TD/HPP+HMAC+calculation)."
  s.authors     = ['Krzysztof Zielonka']
  s.email       = 'aknolezik@gmail.com'
  s.files       = [
    'lib/adyen_hpp_hmac_calculator.rb',
    'lib/adyen_hpp_hmac_calculator/hmac_calculator.rb',
    'lib/adyen_hpp_hmac_calculator/merchant_string_generator.rb'
  ]
  s.license     = 'MIT'
  s.homepage    = 'https://rubygems.org/gems/adyen_hpp_hmac_calculator'

  s.add_development_dependency 'rake', '~>10.4', '~> 10.4.2'
  s.add_development_dependency 'yard', '~>0.8.7', '~> 0.8.7.6'
end
