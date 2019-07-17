#!/usr/bin/ruby

fork do
  5.times do
    sleep 1
    puts "Soy un huérfano"
  end
end

Process.wait
abort "El proceso padre ha terminado..."
