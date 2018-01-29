#!/usr/bin/env ruby

# file: sps_chat.rb

require 'sps-pub'
require 'sps-sub'


class SPSChat

  def initialize(host: 'localhost', port: '8080', \
                  userid: 'user' + (0..1000).to_a.sample.to_s, room: '')

    @userid = userid
    
    sps = SPSSub.new host: host, port: port, callback: self
    puts 'connecting ...'
    sleep 1 # give it a second to connect
    
    topic = ['chat']
    topic << room if room.length > 0

    Thread.new { sps.subscribe topic: (topic + ['#']).join('/') }

    @pub = SPSPub.new address: host, port: port
    
    topic << userid
    @topic = topic.join('/')    

  end

  def send(msg)

    @pub.notice ("%s: %s" % [@topic, msg])

  end
  
  def typing(c)
    
    @pub.notice ("%s/typing: %s" % [@topic, c])
    
  end
             
  
  
  # used by the callback routine
  #
  def ontopic(topic, msg)

    typing = false
    
    a = topic.split('/')
    sender = a.pop
    (sender = a.pop; typing = true) if sender == 'typing'

    return if sender == @userid
    
    typing ? onincoming(sender, msg, true) : onincoming(sender, msg)

  end
    
  def onincoming(sender, msg, typing=false)
    
    puts "%s: %s" % [sender, msg]
    
  end

end

if __FILE__ == $0 then

  chat = SPSChat.new port: 8080
  chat.send 'hello'

end
