# Introducing the Sps_chat gem

The following example shows how to set up a simple chat session between 2 users.

## Installation

Gem install the following:

* simplepubsub
* sps_chat

## Running the SimplePubSub broker

Open an IRB session and paste in the following:

    require 'simplepubsub'

    SimplePubSub::Broker.start(port: 8080)

## Running the SPS chat clients

1) Open another IRB session and paste in the following:

    require 'sps_chat'

    chat = SPSChat.new port: 8080

2) Open another IRB session and paste the above code into it

3) Type the following in IRB session 1: 

    chat.send 'hello'

4) Now type the following in IRB session 2:

    chat.send 'hi!'

5) Observe the message sent from IRB session 1 appeared in session 2, and the message from IRB session 2 appeared in session 1.

Notes:

* If no userid is given, one is created. To specify a userid, pass it into the intialize method e.g.
    SPSChat.new port: 8080, userid: Cedrik
* The topic is set to *chat* followed by the *userid* (e.g. chat/user777)

## Resources

* ?Introducing the Sps-sub gem http://www.jamesrobertson.eu/snippets/2015/may/16/introducing-the-sps-sub-gem.html?


spschat gem simplepubsub
