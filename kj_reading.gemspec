Gem::Specification.new do |s|
  s.name = 'kj_reading'
  s.version = '0.2.0'
  s.summary = 'A wrapper of the Kj gem. Usage: KjReading.text "mt 16, 18"'
  s.authors = ['James Robertson']
  s.files = Dir['lib/kj_reading.rb']
  s.add_runtime_dependency('kj', '~> 0.0', '>=0.0.16')
  s.signing_key = '../privatekeys/kj_reading.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/kj_reading'
end
