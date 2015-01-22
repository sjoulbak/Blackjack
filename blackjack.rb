class Deck #Dit is het kaarten gedeelte
	def initialize
		@type = [2,3,4,5,6,7,8,9,10,'Boer','Konining','Koning','A\'s']
		@kaarten = [@type, @type, @type, @type]
		@soorten = ['Harten', 'Klaver', 'Schoppen', 'Ruiten']
	end

	def removeCard i, j
		@kaarten[i].delete_at(j)
	end

	def showCard i, j
		@typeKaart = @kaarten[i][j]
		@kaarten.each_with_index do |item, a|
			if a == i
				@soort = @soorten[a]
			end
		end
		@waardeKaart = value j
		return [@typeKaart, @soort, @waardeKaart]
	end

	def value j
		@waarde = j 
		if @waarde == 12
			while true
				system'cls' 
				puts "Hoeveel is de A waard, 1 of 11?"
				@waarde = gets.chomp.to_i
				if @waarde == 1 || @waarde == 11
					break
				end
			end
			return @waarde
		elsif @waarde + 2 > 10
				return 10
		else
			return @waarde + 2
		end
	end
end