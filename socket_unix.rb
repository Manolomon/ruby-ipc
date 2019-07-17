#!/usr/bin/ruby

require 'socket'

socket_hijo, socket_padre = Socket.pair(:UNIX, :DGRAM, 0)
longitud_maxima_bytes = 1000

fork do
  socket_padre.close

  4.times do
    instruccion = socket_hijo.recv(longitud_maxima_bytes)
    socket_hijo.send("¡#{instruccion} terminado!", 0)
  end
end

socket_hijo.close

2.times do
  socket_padre.send("Hacer pesas", 0)
end

2.times do
  socket_padre.send("Hacer sentadillas", 0)
end

4.times do
  $stdout.puts socket_padre.recv(longitud_maxima_bytes)
end