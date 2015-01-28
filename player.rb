class Player
	def initialize(deck, naam)
		@naam = naam
		@deck = deck
		@kaarten = []
		@punten = 0
		@status = true
	end
	def show_cards #Dit gaat waarschijnlijk weg! :)
		puts "#{@naam} heeft de volgende kaarten:"
		@kaarten.each do |type, soort, waarde|
			puts " - Een #{soort} #{type.to_s} met een waarde #{waarde}"
		end
		puts "Een totaal van: #{@punten}"
	end
	def set_status
		@status = false
	end
	def get_status
		@status
	end
	def get_points
		@punten
	end
	def add_card 
		@nieuweKaart = @deck.get_card
		@kaarten.push(@nieuweKaart)
		@punten += @nieuweKaart[2]
		return @nieuweKaart
	end
	def change_a
		@kaarten.each_with_index do |type, soort, waarde, i|
			if type == 'A\'s' && waarde == 11
				@kaarten[i][2] = 1
			end
		end
	end
end