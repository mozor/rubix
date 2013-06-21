require 'isaac'

configure do |c|
  c.nick    = "Rubix"
  c.server  = "irc.mozor.net"
  c.port    = 6667
  c.realname = "I'm Not Pipsqueek"
  c.verbose  = true
  c.version  = 'Rubix v0.0.0 - http://git.io/PA4fhA'
end

helpers do
  def check
    msg channel, "this channel, #{channel}, is awesome!"
  end
end

on :channel, /quote/ do
  msg channel, "#{nick} requested a quote: '<NeWtoz> i love me some fried foods.'"
end

on :channel, /newtoz/ do
  msg channel, "NeWtoz - The 'Predominate Part Of Rubix' since 30 seconds ago!"
end

on :channel, /status/ do
  check
end

on :error, 401 do
  puts "Ok, #{nick} doesn't exist."
end

on :connect do
  join "#mozor"
end