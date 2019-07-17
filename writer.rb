#!/usr/bin/ruby

pipe = "/tmp/pied_piper"

`mkfifo #{pipe}` unless File.exists?(pipe)

output = open(pipe, "w+") # the w+ means we don't block
10.times { output.puts rand 100 }
output.flush
output.close

puts "Sent data to pipe #{pipe}"