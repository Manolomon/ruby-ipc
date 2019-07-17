#!/usr/bin/ruby

favorito = fork do
  exit 77
end

no_favorito = fork do
  abort "Quiero que esperen por mi"
end

pid, estatus = Process.waitpid2(favorito)
puts estatus.exitstatus
