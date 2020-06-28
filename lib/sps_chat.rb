#!/usr/bin/env ruby

# file: sps_chat.rb

require 'sps_duplex'


class SPSChat < SPSDuplex

  def initialize(host: 'localhost', port: '8080', \
                  userid: 'user' + (0..1000).to_a.sample.to_s, room: '', \
                 interactive: true)

    @userid = userid    
    super(host: host, port: port, topic: 'chat',
          sub_topic: '#', pub_topic: userid, interactive: interactive)

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
