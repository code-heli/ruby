require_relative  'libs/gehalt.rb'

print "\nNettogehalt (monatlich) eingeben: "
STDOUT.flush
ziel = gets.chomp.to_f

for brutto in (1200..7000)
		
	gehalt = Gehalt.new brutto, 0
		
	if gehalt.get_netto >= ziel
		puts ">> Brutto: #{gehalt.get_gehalt} --> Netto: %.2f" % gehalt.get_netto

		puts "Gesamtkosten DG (monatlich): %.2f" %gehalt.get_gesamtkosten_dg
		break
	end
end