require './deck'
require './player'

class Blackjack
	def initialize
		@a = 6
		@deck = Deck.new
		while @a.to_i > 5
			system'cls'
			puts 'Met hoeveel spelers wil je spelen? (Max 5 spelers)'
			@a = gets.chomp.to_i
		end
		@speler = []
		(1..@a).to_a.each do |i|
			naam = nil
			while naam == nil
				#system'cls'
				puts "Hoe heet speler #{i}?"
				naam = gets.chomp
			end
			@speler[i] = Player.new(@deck, naam)
			@speler[i].add_card && @speler[i].add_card
		end		
		@dealer = Player.new(@deck, 'Dealer')
		@dealer.add_card && @dealer.add_card
	end
	def start
		@stat = @a + 1
		while @stat > 0
			(1..@a).to_a.each do |i|
				if @speler[i].get_status == true
					while true
						system'cls'
						@speler[i].show_cards
						puts
						puts 'Wil je nog een kaart (e)rbij of wil je (s)toppen?'
						keuze = gets.chomp
						if keuze == 'e'
							@speler[i].add_card
							if @speler[i].get_points > 21
								puts
								puts "Je bent af."
								sleep(3)
								@speler[i].set_status
								@stat -= 1
								break
							end
							system'cls'
						elsif keuze == 's'
							@speler[i].set_status
							@stat -= 1
							system'cls'
							break
						end
					end
				end
			end
			if @dealer.get_status == true
				@dealer.add_card
				puts 'yes'
				if check_dealer == true
					@dealer.show_cards
					@dealer.set_status
					@stat -= 1
				end
			end
		end
	end
	def check_dealer
		@dealer.get_points > 21
	end
end

game = Blackjack.new
game.start
