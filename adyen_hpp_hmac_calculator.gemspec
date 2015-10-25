Gem::Specification.new do |s|
  s.name        = 'adyen_hpp_hmac_calculator'
  s.version     = '0.0.1'
  s.date        = '2015-10-07'
  s.summary     = 'Adyen HPP HMAC calculator'
  s.description = 'Adyen merchant signature using sha256 algorithm implementation.'
  s.authors     = ['Krzysztof Zielonka']
  s.email       = 'kzielonka@ymail.com'
  s.files       = [
    'lib/adyen_hpp_hmac_calculator.rb',
    'lib/adyen_hpp_hmac_calculator/hmac_calculator.rb',
    'lib/adyen_hpp_hmac_calculator/merchant_string_generator.rb'
  ]
  s.license     = 'MIT'

  s.add_development_dependency 'rake', '~>10.4', '~> 10.4.2'
  s.add_development_dependency 'yard', '~>0.8.7', '~> 0.8.7.6'
end
