class Gehalt
	def initialize gehalt, kinder
		@nettoinput = gehalt

		@bruttogehalt = gehalt

		@kinder = kinder

###Brutto zu Netto###
		
	####Dienstnehmer####

		#Krankenversicherung
		@kv_dn = @bruttogehalt * 0.0387

		#Pensionsversicherung
		@pv_dn = @bruttogehalt * 0.1025

		#Arbeitslosenversicherung
		if @bruttogehalt > 1648 && @bruttogehalt < 4980
			@arbeitslosen_dn = @bruttogehalt * 0.03
		elsif @bruttogehalt <= 1342
			@arbeitslosen_dn = 0
		elsif @bruttogehalt <= 1464 
			@arbeitslosen_dn = @bruttogehalt * 0.01
		elsif @bruttogehalt <= 1648
			@arbeitslosen_dn = @bruttogehalt * 0.02
		end

		#Arbeiterkammerumlage
		@ak_dn = @bruttogehalt * 0.005

		#Wohnbauförderungsbeitrag
		@wohnbau_dn = @bruttogehalt * 0.005

		#Versicherung DN gesamt
		@vers_dn = @kv_dn + @pv_dn + @arbeitslosen_dn + @ak_dn + @wohnbau_dn

		#Lohnsteuerbemessungsgrundlage
		@lohnsteuer_bgrundlage = @bruttogehalt - @vers_dn

		#Lohnsteuer		
		if @kinder == 0
			if @lohnsteuer_bgrundlage > 7516 && @lohnsteuer_bgrundlage < 83349.33
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.50) - 1051.33
			elsif @lohnsteuer_bgrundlage > 5016 && @lohnsteuer_bgrundlage < 7516
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.48) - 901.01
			elsif @lohnsteuer_bgrundlage > 2599.33 && @lohnsteuer_bgrundlage < 5016
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.42) - 600.05
			elsif @lohnsteuer_bgrundlage > 1516 && @lohnsteuer_bgrundlage < 2599.33
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.35) - 418.10
			elsif @lohnsteuer_bgrundlage > 1066 && @lohnsteuer_bgrundlage < 1516
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.25) - 266.50
			else
				@lohnsteuer = 0
			end

		elsif @kinder == 1
			if @lohnsteuer_bgrundlage > 7516 && @lohnsteuer_bgrundlage < 83349.33
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.50) - 1092.50
			elsif @lohnsteuer_bgrundlage > 5016 && @lohnsteuer_bgrundlage < 7516
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.48) - 942.18
			elsif @lohnsteuer_bgrundlage > 2599.33 && @lohnsteuer_bgrundlage < 5016
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.42) - 641.22
			elsif @lohnsteuer_bgrundlage > 1516 && @lohnsteuer_bgrundlage < 2599.33
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.35) - 459.27
			elsif @lohnsteuer_bgrundlage > 1066 && @lohnsteuer_bgrundlage < 1516
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.25) - 307.67
			else
				@lohnsteuer = 0
			end

		end

		#Netto
		@nettogehalt = @bruttogehalt - @vers_dn - @lohnsteuer

=begin
		####Dienstgeber####

		#Krankenversicherung
		@kv_dg = @bruttogehalt * 0.0378

		#Pensionsversicherung
		@pv_dg = @bruttogehalt * 0.1255

		#Arbeitslosenversicherung
		@arbeitslosen_dg = @bruttogehalt * 0.03

		#Unfallversicherung
		@uv_dg = @bruttogehalt * 0.013

		#Wohnbauförderungsbetrag
		@wohnbau_dg = @wohnbau_dn

		#Insolvenzentgeltsicherung
		@insolvenz_dg = @bruttogehalt * 0.0035

		#Betriebliche Vorsorge
		@vorsorge_dg = @bruttogehalt * 0.0153

		#Versicherung DG gesamt		
		@vers_dg = kv_dg + @pv_dg + @arbeitslosen_dn + @uv_dg + @wohnbau_dn + @insolvenz_dg + @vorsorge_dg
=end

###Netto zu Brutto###
if @netto == @gehalt
	
		@lohnsteuer = (@lohnsteuer_bgrundlage * 0.50) - 1051.33
	elsif @lohnsteuer_bgrundlage > 5016 && @lohnsteuer_bgrundlage < 7516
		@lohnsteuer = (@lohnsteuer_bgrundlage * 0.48) - 901.01
	elsif @lohnsteuer_bgrundlage > 2599.33 && @lohnsteuer_bgrundlage < 5016
		@lohnsteuer = (@lohnsteuer_bgrundlage * 0.42) - 600.05
	elsif @lohnsteuer_bgrundlage > 1516 && @lohnsteuer_bgrundlage < 2599.33
		@lohnsteuer = (@lohnsteuer_bgrundlage * 0.35) - 418.10
	elsif @lohnsteuer_bgrundlage > 1066 && @lohnsteuer_bgrundlage < 1516
		@lohnsteuer = (@lohnsteuer_bgrundlage * 0.25) - 266.50
	end

	end

	def get_methode
		@methode
	end

	def get_brutto
		@bruttogehalt
	end

	def get_kinder
		@kinder
	end

	def get_vers_dn
		@vers_dn
	end

	def get_lohnsteuer
		@lohnsteuer
	end

	def get_netto
		@nettogehalt
	end

end

class GehaltPrinter
	def initialize gehaltToPrint
		@gehaltToPrint = gehaltToPrint
	end

	def show
		if $methode == "brutto"
			puts "Kinder: #{@gehaltToPrint.get_kinder}"
			puts "Versicherungskosten anzeigen? (j/n)"
			print "> "
			STDOUT.flush
			vers_anzeigen = gets.chomp
			vers_anzeigen.downcase!
			if vers_anzeigen == "j"
				puts ">> Versicherungenkosten DN: %.2f" % @gehaltToPrint.get_vers_dn
			end

			puts "Lohnsteuer anzeigen? (j/n)"
			print "> "
			STDOUT.flush
			lohnst_anzeigen = gets.chomp
			lohnst_anzeigen.downcase!
			if lohnst_anzeigen == "j"
				puts ">> Lohnsteuer DN: %.2f" % @gehaltToPrint.get_lohnsteuer
			end
			puts "------------------", ">> Netto monatlich: %.2f" % @gehaltToPrint.get_netto
		else
			puts "Netto berechnen"
		end
			
	end


end
rechner = "j"
$methode = ""
while rechner == "j" do
	puts "Was soll berechnet werden? (brutto/netto): "
	print "> "
	STDOUT.flush
	$methode = gets.chomp
	$methode.downcase!
	if $methode == "netto"
		print "Nettogehalt (monatlich) eingeben: "
		STDOUT.flush
	elsif $methode == "brutto"	
		print "Bruttogehalt (monatlich) eingeben: "
		STDOUT.flush
	end

	gehalt = Gehalt.new gets.chomp.to_f, 0

	printer = GehaltPrinter.new gehalt

	printer.show

	#Erneut berechnen - Schleife 
	puts "\n\n==============", "Erneut berechnen? (j/n)", "=============="
	print "> "
	STDOUT.flush
	rechner = gets.chomp
	rechner.downcase!
end









