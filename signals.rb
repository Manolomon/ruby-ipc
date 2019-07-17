#!/usr/bin/ruby

procesos_hijos = 3
procesos_terminados = 0

procesos_hijos.times do
  fork do
  # Duermen por tres segundos
  sleep 3
  end
end

# El proceso padre estará ocupado realizando
# operaciones matemáticas, pero queremos saber cuando
# uno de sus hijos termnine al atrapar la señal :CHLD
trap(:CHLD) do
  # Dado que Process.waut encola cualquier dato se puede preguntar
  # aquí ya que sabemos que un proceso hijo ha terminado
  puts Process.wait
  procesos_terminados += 1
  # Salimos del programa de manera explícita cuando se
  # han contado todos los procesos hijos
  exit if procesos_terminados == procesos_hijos
end
# El trabajo del padre no tiene fin
loop do
  (Math.sqrt(rand(44)) ** 8).floor
  sleep 1
end