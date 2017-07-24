rechner = ""
loop do
	load  'libs/gehalt.rb'
	$methode == ""

	print "\n\nWas berechnen? (brutto/netto): "
	STDOUT.flush
	$methode = gets.chomp

	if $methode == "brutto"
		load 'brutto-berechnen.rb'
	elsif $methode == "netto"
		load 'netto-berechnen.rb'
	end

	print "\n\nRechner neu starten? (j/n): "
	STDOUT.flush
	rechner == gets.chomp


	break if rechner == "n"
end