#!/usr/bin/env ruby

require 'rubygems'
require 'xmpp4r'
require 'xmpp4r/muc/helper/simplemucclient'
require 'commands'

if ARGV.size != 3
  puts "Usage: #{$0} <jid> <password> <room@conference/nick>"
  exit
end

include Jabber

cl = Client.new(Jabber::JID.new(ARGV[0]))
cl.connect
cl.auth(ARGV[1])

m = MUC::SimpleMUCClient.new(cl)

##### EVENTS #####

m.on_message do |time, nickname, text|
  if time.nil? && text.strip =~ /^(.+?):\s([^\s]+)\s*(.*)$/ && $1.downcase == m.jid.resource.downcase
    command_name = $2
    args = $3.split
    begin
      m.say Commands.execute(command_name, *args)
    rescue UnknownCommand
      m.say "Unknown command: #{command_name}"
    rescue StandardError => e
      m.say "Exception: #{e}"
    end
  end
end

##### END EVENTS #####

m.join(ARGV[2])

Thread.stop

cl.close