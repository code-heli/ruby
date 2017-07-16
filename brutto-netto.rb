class Gehalt
		def brutto
		#puts "Bruttogehalt eingeben: "
		input= gets.chomp
		@bruttogehalt = Integer(input)
		puts "Bruttogehalt: %.2f" % @bruttogehalt, "----------------------"
	end

####Dienstnehmer####
	def krankenversicherung_dn
		@kranken_dn = @bruttogehalt * 0.0387
	end

	def pensionsversicherung_dn
		@pension_dn = @bruttogehalt * 0.1025
	end

=begin	def arbeitslosenversicherung_dn
		if @bruttogehalt > 1648
			@arbeitslosen_dn = @bruttogehalt * 0.03
		elsif @bruttogehalt <= 1648
			@arbeitslosen_dn = @bruttogehalt * 0.02
		elsif @bruttogehalt <= 1464 
			@arbeitslosen_dn = @bruttogehalt * 0.01
		elsif @bruttogehalt <= 1342
			@arbeitslosen_dn = 0
		end
=end	end
	def arbeitslosenversicherung_dn
		if @bruttogehalt > 1648
			@arbeitslosen_dn = @bruttogehalt * 0.03
		elsif @bruttogehalt <= 1342
			@arbeitslosen_dn = 0
		elsif @bruttogehalt <= 1464 
			@arbeitslosen_dn = @bruttogehalt * 0.01
		elsif @bruttogehalt <= 1648
			@arbeitslosen_dn = @bruttogehalt * 0.02
		end
	end


	def arbeiterkammerumlage_dn
		@arbeit_dn = @bruttogehalt * 0.005
	end

	def wohnbaufoerderung_dn
		@wohnbau_dn = @bruttogehalt * 0.005
	end

	def versicherung_gesamt_dn
		@versicherung_dn = @kranken_dn + @pension_dn + @arbeitslosen_dn + @arbeit_dn + @wohnbau_dn
		puts "Versicherung DN gesamt: %.2f" % @versicherung_dn
	end

	def netto
		@nettogehalt = @bruttogehalt - @versicherung_dn
		puts "----------------------", "Nettogehalt: %.2f" % @nettogehalt 
	end
####Dienstnehmer-END####

####Dienstgeber####
	def krankenversicherung_dg
		@kranken_dg = @bruttogehalt * 0.0378
	end

	def pensionsversicherung_dg
		@pension_dg = @bruttogehalt * 0.1255
	end

	def arbeitslosenversicherung_dg
		@arbeitslosen_dg = @bruttogehalt * 0.03
	end

	def unfallversicherung_dg
		@unfall_dg = @bruttogehalt * 0.013
	end

	def wohnbaufoerderung_dg
		@wohnbau_dg = @bruttogehalt * 0.005
	end

	def insolvenzentgeltversicherung_dg
		@insolvenz_dg = @bruttogehalt * 0.0035
	end

	def betriebliche_vorsorge_dg
		@vorsorge_dg = @bruttogehalt * 0.0153
		puts "Betriebliche Vorsorge: %.2f" % @vorsorge_dg
	end

	def versicherung_gesamt_dg
		@versicherung_dg = @kranken_dg + @pension_dg + @arbeitslosen_dg + @unfall_dg + @wohnbau_dg + @insolvenz_dg
		puts "Versicherung DG gesamt: %.2f" % @versicherung_dg
	end 
####Dienstgeber-END####



end

gehalt = Gehalt.new

gehalt.brutto
#Versicherung DN
gehalt.krankenversicherung_dn
gehalt.pensionsversicherung_dn
gehalt.arbeitslosenversicherung_dn
gehalt.arbeiterkammerumlage_dn
gehalt.wohnbaufoerderung_dn
#Versicherung DN
gehalt.versicherung_gesamt_dn

#Versicherung DG
gehalt.krankenversicherung_dg
gehalt.pensionsversicherung_dg
gehalt.arbeitslosenversicherung_dg
gehalt.unfallversicherung_dg
gehalt.wohnbaufoerderung_dg
gehalt.insolvenzentgeltversicherung_dg
gehalt.betriebliche_vorsorge_dg
#Versicherung DG
gehalt.versicherung_gesamt_dg


gehalt.netto