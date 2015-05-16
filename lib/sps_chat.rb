#!/usr/bin/env ruby

# file: sps_chat.rb

require 'sps-pub'
require 'sps-sub'


class SPSChat

  def initialize(host: 'localhost', port: '8080', \
                  userid: 'user' + (0..1000).to_a.sample.to_s)

    @userid = userid
    
    sps = SPSSub.new host: host, port: port, callback: self
    puts 'connecting ...'
    sleep 1 # give it a second to connect

    Thread.new { sps.subscribe topic: 'chat/#' }
    @pub = SPSPub.new address: host, port: port

  end

  def send(msg)

    @pub.notice ("chat/%s: %s" % [@userid, msg])

  end

  # used by the callback routine
  #
  def ontopic(topic, msg)

    sender = topic.split('/').last
    return if sender == @userid
    onincoming sender, msg

  end

  def onincoming(sender, msg)
    puts "%s: %s" % [sender, msg]
  end

end

if __FILE__ == $0 then

  chat = SPSChat.new port: 8080
  chat.send 'hello'

end
