#!/usr/bin/ruby

pipe = "/tmp/pied_piper"

`mkfifo #{pipe}` unless File.exists?(pipe)

input = open(pipe, "r") # NOTE: in prod, probably use "r+",
                        # so there is no blocking, EOF errors

arr = Array.new

while line = input.gets
    arr.push(line)
end

arr.each do |num|
    puts num
end

puts "-------"

arr.sort.each do |num|
    puts num
end

puts "Read data from pipe #{pipe}"