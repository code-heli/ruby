class Gehalt
	def initialize gehalt, kinder

		@kinder = kinder

		@gehalt = gehalt
		
		####Dienstnehmer####

		#Krankenversicherung
		@kv_dn = @gehalt * 0.0387

		#Pensionsversicherung
		@pv_dn = @gehalt * 0.1025

		#Arbeitslosenversicherung
		if @gehalt >= 4980
			@arbeitslosen_dn = 4980 * 0.03
		elsif @gehalt > 1648
			@arbeitslosen_dn = @gehalt * 0.03
		elsif @gehalt <= 1342
			@arbeitslosen_dn = 0
		elsif @gehalt <= 1464 
			@arbeitslosen_dn = @gehalt * 0.01
		elsif @gehalt <= 1648
			@arbeitslosen_dn = @gehalt * 0.02
		end

		#Arbeiterkammerumlage
		@ak_dn = @gehalt * 0.005

		#Wohnbauförderungsbeitrag
		@wohnbau_dn = @gehalt * 0.005

		#Versicherung DN gesamt
		if @gehalt > 425
			@vers_dn = @kv_dn + @pv_dn + @arbeitslosen_dn + @ak_dn + @wohnbau_dn
		elsif @gehalt <=425
			@vers_dn = 0
		end
		#Lohnsteuerbemessungsgrundlage
		@lohnsteuer_bgrundlage = @gehalt - @vers_dn

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
		@nettogehalt = @gehalt - @vers_dn - @lohnsteuer



		####Dienstgeber####

		#Krankenversicherung
		@kv_dg = @gehalt * 0.0378

		#Pensionsversicherung
		@pv_dg = @gehalt * 0.1255

		#Arbeitslosenversicherung
		@arbeitslosen_dg = @gehalt * 0.03

		#Unfallversicherung
		@uv_dg = @gehalt * 0.013

		#Wohnbauförderungsbetrag
		@wohnbau_dg = @gehalt * 0.005

		#Insolvenzentgeltsicherung
		@insolvenz_dg = @gehalt * 0.0035

		#Betriebliche Vorsorge
		@vorsorge_dg = @gehalt * 0.0153

		#Versicherung DG gesamt		
		@vers_dg = @kv_dg + @pv_dg + @arbeitslosen_dg + @uv_dg + @wohnbau_dg + @insolvenz_dg + @vorsorge_dg

		@gesamtkosten_dg = @gehalt + (@vers_dg* 14/12) *14/12
	
	end 

	def get_methode
		@methode
	end

	def get_gehalt #Input
		@gehalt
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

	def get_brutto
		@bruttogehalt
	end

	def get_netto
		@nettogehalt
	end

	def get_vers_dg
		@vers_dg
	end

	def get_gesamtkosten_dg
		@gesamtkosten_dg
	end

end


class GehaltPrinter
	def initialize gehaltToPrint
		@gehaltToPrint = gehaltToPrint
	end

	def show
		puts ">> Versicherungenkosten DN: %.2f" % @gehaltToPrint.get_vers_dn

			puts ">> Lohnsteuer DN: %.2f" % @gehaltToPrint.get_lohnsteuer
			puts "Dienstgeber-Abgaben anzeigen? (j/n)"
			print "> "
			STDOUT.flush
			dg_anzeigen = gets.chomp
			dg_anzeigen.downcase!
			if dg_anzeigen == "j"
				puts ">> Versicherungskosten + Betriebliche Vorsorge DG: %.2f" % @gehaltToPrint.get_vers_dg
				puts ">> Gesamtkosten DG: %.2f" % @gehaltToPrint.get_gesamtkosten_dg
			end

			puts "-------------------", ">> Netto monatlich: %.2f" % @gehaltToPrint.get_netto, "                    ======="
	end
end
