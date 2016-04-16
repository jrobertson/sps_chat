Gem::Specification.new do |s|
  s.name = 'sps_chat'
  s.version = '0.1.1'
  s.summary = 'A simple chat client which sends and receives messages through the SimplePubSub broker'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.add_runtime_dependency('sps-sub', '~> 0.2', '>=0.2.0')
  s.add_runtime_dependency('sps-pub', '~> 0.4', '>=0.4.0')  
  s.signing_key = '../privatekeys/sps_chat.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/sps_chat'
end
