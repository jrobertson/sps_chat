Gem::Specification.new do |s|
  s.name = 'sps_chat'
  s.version = '0.2.2'
  s.summary = 'A simple chat client which sends and ' + 
      'receives messages through the SimplePubSub broker.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/sps_chat.rb']
  s.add_runtime_dependency('sps_duplex', '~> 0.1', '>=0.1.0')
  s.signing_key = '../privatekeys/sps_chat.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/sps_chat'
end
