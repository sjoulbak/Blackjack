class Deck #Dit is het kaarten gedeelte
	def initialize
		@type = [2,3,4,5,6,7,8,9,10,'Boer','Konining','Koning','A\'s']
		@kaarten = [@type.clone, @type.clone, @type.clone, @type.clone]
		@soorten = ['Harten', 'Klaver', 'Schoppen', 'Ruiten']
	end
	def showDeck
		puts @kaarten
	end
	def getCard
		@typeKaart = nil
		while @typeKaart == nil
			i = rand(0..3)
			j = rand(0..12)
			@typeKaart = @kaarten[i][j]
		end
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
			while true
				system'cls' 
				puts "Hoeveel is de #{soort} A waard, 1 of 11?"
				j = gets.chomp.to_i
				if j == 1 || j == 11
					return j
				end
			end
		elsif j + 2 > 10
			return 10
		else
			return j + 2
		end
	end
end

class Speler
	def initialize(deck, naam)
		@naam = naam
		@deck = deck
		@kaarten = []
		@punten = 0
	end

	def showCards #Dit gaat waarschijnlijk weg! :)
		system'cls'
		puts "#{@naam} heeft de volgende kaarten:"
		@kaarten.each do |type, soort, waarde|
			puts " - Een #{soort} #{type.to_s} met een waarde #{waarde}"
		end
		puts 
		puts "Een totaal van: #{@punten}"
	end

	def addCard
		@nieuweKaart = @deck.getCard
		@kaarten.push(@nieuweKaart)
		@punten += @nieuweKaart[2]
		return @nieuweKaart
	end
end

deck1 = Deck.new
speler1 = Speler.new(deck1, 'Remco')
52.times do
	speler1.addCard
end
speler1.showCards