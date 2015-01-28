class Deck #Dit is het kaarten gedeelte
	def initialize
		@type = [2,3,4,5,6,7,8,9,10,'Boer','Konining','Koning','A\'s']
		@kaarten = [@type.clone, @type.clone, @type.clone, @type.clone]
		@soorten = ['Harten', 'Klaver', 'Schoppen', 'Ruiten']
		@hoeveelheid = 52
	end
	def show_deck
		puts @kaarten
	end
	def get_hoeveelheid
		@hoeveelheid
	end
	def get_card 
		@typeKaart = nil
		while @typeKaart == nil
			i = rand(0..3)
			j = rand(0..12)
			@typeKaart = @kaarten[i][j]
		end
		@hoeveelheid -= 1
		@kaarten.each_with_index do |item, a|
			if a == i
				@soort = @soorten[a]
			end
		end
		@waardeKaart = value j, @soort
		@kaarten[i][j] = nil
		return [@typeKaart, @soort, @waardeKaart]
	end
	def value j, soort
		if j == 12
			return 11
		elsif j + 2 > 10
			return 10
		else
			return j + 2
		end
	end
end