

class GehaltPrinter
	def initialize gehaltToPrint
		@gehaltToPrint = gehaltToPrint
	end

	def show
		if $methode == "netto"
			if @gehaltToPrint.get_kinder != 0
				puts "Kinder: #{@gehaltToPrint.get_kinder}"
			end
			#Abfrage Versicherung anzeigen
			#puts "\n-------------------", "Versicherungskosten anzeigen? (j/n)"
			#print "> "
			#STDOUT.flush
			#vers_anzeigen = gets.chomp
			#vers_anzeigen.downcase!
			#if vers_anzeigen == "j"
				puts ">> Versicherungenkosten DN: %.2f" % @gehaltToPrint.get_vers_dn
			#end
			#Abfrage Lohnsteuer anzeigen
			#puts "Lohnsteuer anzeigen? (j/n)"
			#print "> "
			#STDOUT.flush
			#lohnst_anzeigen = gets.chomp
			#lohnst_anzeigen.downcase!
			#if lohnst_anzeigen == "j"
				puts ">> Lohnsteuer DN: %.2f" % @gehaltToPrint.get_lohnsteuer
			#end

			##Abfrage Dienstgeber-Abgaben anzeigen
			puts "Dienstgeber-Abgaben anzeigen? (j/n)"
			print "> "
			STDOUT.flush
			dg_anzeigen = gets.chomp
			dg_anzeigen.downcase!
			if dg_anzeigen == "j"
				puts ">> Versicherungskosten + Betriebliche Vorsorge DG: %.2f" % @gehaltToPrint.get_vers_dg
			end

			puts "-------------------", ">> Netto monatlich: %.2f" % @gehaltToPrint.get_netto, "                    ======="
		else
			puts "-------------------",  ">> Brutto monatlich ungefähr: #{@gehaltToPrint.get_brutto}"
			#puts "-------------------",  ">> Brutto monatlich ungefähr: %.2f" % @gehaltToPrint.get_brutto

		end
			
	end


end
$methode = ""
loop do
	loop do
		print "Was soll berechnet werden? (brutto/netto): "
		STDOUT.flush
		$methode = gets.chomp
		$methode.downcase!
		break if $methode == "brutto" || $methode == "netto"
		puts "Eingabe ungültig!"
	end

	if $methode == "brutto"
		print "\nNettogehalt (monatlich) eingeben: "
		STDOUT.flush







	elsif $methode == "netto"	
		print "\nBruttogehalt (monatlich) eingeben: "
		STDOUT.flush
	end



	gehalt = Gehalt.new gets.chomp.to_f, 0

	printer = GehaltPrinter.new gehalt

	printer.show

	#Erneut berechnen - Schleife 
	puts "\n\n ===Erneut berechnen? (j/n)==="
	print "> "
	STDOUT.flush
	rechner = gets.chomp
	rechner.downcase!
	system "clear"
	break if rechner == "n"
end









