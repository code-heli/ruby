class Gehalt
	def set_brutto (amount, children)
		@bruttogehalt = amount

		@kinder = children
		
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

		elsif @kinder == 2
			if @lohnsteuer_bgrundlage > 7516 && @lohnsteuer_bgrundlage < 83349.33
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.50) - 1107.08
			elsif @lohnsteuer_bgrundlage > 5016 && @lohnsteuer_bgrundlage < 7516
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.48) - 956.76
			elsif @lohnsteuer_bgrundlage > 2599.33 && @lohnsteuer_bgrundlage < 5016
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.42) - 655.80
			elsif @lohnsteuer_bgrundlage > 1516 && @lohnsteuer_bgrundlage < 2599.33
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.35) - 473.85
			elsif @lohnsteuer_bgrundlage > 1066 && @lohnsteuer_bgrundlage < 1516
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.25) - 322.25
			else
				@lohnsteuer = 0
			end

		elsif @kinder == 3
			if @lohnsteuer_bgrundlage > 7516 && @lohnsteuer_bgrundlage < 83349.33
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.50) - 1125.42
			elsif @lohnsteuer_bgrundlage > 5016 && @lohnsteuer_bgrundlage < 7516
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.48) - 975.10
			elsif @lohnsteuer_bgrundlage > 2599.33 && @lohnsteuer_bgrundlage < 5016
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.42) - 674.14
			elsif @lohnsteuer_bgrundlage > 1516 && @lohnsteuer_bgrundlage < 2599.33
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.35) - 492.18
			elsif @lohnsteuer_bgrundlage > 1066 && @lohnsteuer_bgrundlage < 1516
				@lohnsteuer = (@lohnsteuer_bgrundlage * 0.25) - 340.58
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
	end

	def get_kinder
		@kinder
	end

	def get_brutto
		@bruttogehalt
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

gehalt = Gehalt.new

gehalt.set_brutto gets.chomp.to_i, 0
puts "Brutto monatlich: %.2f" % gehalt.get_brutto
puts "Kinder: #{gehalt.get_kinder}"
puts "Versicherungen DN: %.2f" % gehalt.get_vers_dn
puts "Lohnsteuer DN: %.2f" % gehalt.get_lohnsteuer
puts "Netto monatlich: %.2f" % gehalt.get_netto

