require_relative  'libs/gehalt.rb'

=begin
	for brutto in (1300..1400)
		gehalt = Gehalt.new brutto, 0
		print "Brutto: #{gehalt.get_gehalt} -- Netto: #{gehalt.get_netto}\n\n"
	end
=end

print "\nBruttogehalt (monatlich) eingeben: "
STDOUT.flush

gehalt = Gehalt.new gets.chomp.to_f, 0

printer = GehaltPrinter.new gehalt

printer.show