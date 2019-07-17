#!/usr/bin/ruby

reader, writer = IO.pipe

fork do
  reader.close

  10.times do
    # Aquí se haría un trabajo pesado
    writer.puts "Se ha terminado el trabajo."
    end
end

writer.close

while mensaje = reader.gets
  $stdout.puts mensaje
end