# benchmark.rb

# Este script se trata de un simple benchmark que utiliza la librería
#Benchmark de Ruby. En él se utilizan arrays de millones de datos en
#los que se escriben y/o leen datos, calculando los tiempos y operando
#con estos tiempos para presentarlos de forma visual.

require 'benchmark'
include Benchmark

n = 50000000

Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
	#tiempo en recorrer un array con bucle for
	tf = x.report("for:")		{ for i in 1..n; a = "1"; end }
	#tiempo en recorrer un array con bucle times
	tt = x.report("times:")	{ n.times do   ; a = "1"; end }
	#tiempo en recorrer un array con bucle upto
	tu = x.report("upto:")	{ 1.upto(n) do ; a = "1"; end }
	#cálculo del total y la media
	[tf+tt+tu, (tf+tt+tu)/3]
end
