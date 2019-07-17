#!/usr/bin/ruby

# Se crean 5 procesos hijos
5.times do
  # Cada uno genera un número aleatorio. Si es par termina
  # con un código de salida 111, si no, con 112
  fork do
    if rand(5).even?
      exit 111
    else
      exit 112
    end
  end
end

5.times do
  # Se espera a que cada uno de los procesoshijos termine
  pid, status = Process.wait2

  if status.exitstatus == 111
    puts "#{pid} obtuvo un número par"
  else
    puts "#{pid} obtuvo un número impar"
  end
end
