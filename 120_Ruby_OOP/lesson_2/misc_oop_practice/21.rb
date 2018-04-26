# dealer takes a deck of cards shuffles cards and deals them to players,
# players take turn looking at cards and attempt to get as close as possible
# to 21 without busting

# rules house must hit at 15 or below,
module DeckMath
  CARD_VALUES = {'Ace' => [1, 11], 'Jack' => 10, 'Queen' => 10, 'King' => 10 }

  def calculate_hand
    current_total = 0
    @hand.each do |card|
      if card[0] == 'Ace' && current_total > 11
        current_total += 1
      elsif card[0] == 'Ace'
        current_total += 11
      elsif CARD_VALUES.include?(card[0])
        current_total += 10
      else
        current_total += card[0].to_i
      end
    end
    current_total
  end

  def self.to_value(card)
    if card[0] == 'Ace'
      11
    elsif CARD_VALUES.include?(card[0])
      10
    else
      card[0].to_i
    end
  end
end

module Actions
  def options
    %w[hit stay]
  end

  def hit
    @hand << @dealer.deal_card
  end

  def stay
    puts 'you have chosen to stay'
  end
end

class Player
  include DeckMath
  include Actions
  attr_accessor :hand, :current_hand_total, :name, :actions

  def initialize
    @hand = []
    @current_hand_total = 0
  end
end

class Human < Player
  def initialize
    super
    @name = set_name
  end

  def set_name
    name = nil
    loop do
      puts "What is your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Please enter your name."
    end
    name
  end
end

class Dealer < Player
  attr_accessor :game_deck, :visable_total, :hidden_card
  NAMES = %w[bobby red timmy jimmy]

  def initialize
    super
    @name = set_name
    @game_deck = Deck.new
    @visable_total = 0
  end

  def set_name
    NAMES.sample
  end

  def visable_total
    @hidden_card = hand[0]
    current_hand_total - DeckMath.to_value(@hidden_card)
  end
end

class Deck
  attr_accessor :deck
  SUITS = %w[hearts dimaonds spades clubs]
  FACES = %w[Ace 1 2 3 4 5 6 7 8 9 Jack Queen King]

  def initialize
    @deck = build_deck
  end

  def build_deck
    FACES.product(SUITS).shuffle
  end

  def deal_card
    deck.pop
  end
end


class Display
end

class GameEngine
  attr_accessor :human, :dealer
  attr_reader :deck_tracker

  def initialize
    system 'clear'
    @human = Human.new
    @dealer = Dealer.new
  end

  def display_names
    puts "Good day #{@human.name}! Welcome to the table the dealer's name is #{@dealer.name}"
  end

  def deal_starting_hand
    @human.hand   << @dealer.game_deck.deal_card
    @dealer.hand  << @dealer.game_deck.deal_card
    @human.hand   << @dealer.game_deck.deal_card
    @dealer.hand  << @dealer.game_deck.deal_card
  end

  def display_player_hand
    puts "Cards are being delt..."
    sleep(0.5)
    puts "Your staring hand is:"
    puts '-' * 20
    puts "a #{display_card(@human.hand[0])} and a #{display_card(@human.hand[1])}"
  end

  def display_dealer_hand
    puts "-" * 20
    puts "#{@dealer.name} is showing a #{@dealer.hand[1][0]} of #{@dealer.hand[1][1]}"
  end

  def calculate_hands
    @human.current_hand_total = @human.calculate_hand
    @dealer.current_hand_total = @dealer.calculate_hand
  end

  def display_players_hand_total
    puts "#{@human.name} you are showing a current hand total of #{@human.current_hand_total}."
  end

  def display_dealer_hand_total
    puts "#{@dealer.name} the dealer, is showing a total of #{@dealer.visable_total}"
  end

  def display_delt_card(card)
    puts "A #{display_card(card)} was drawn."
  end

  def display_card(card)
    "#{card[0]} of #{card[1]}"
  end

  # Displays
  def setup_display
    display_names
    deal_starting_hand
    display_player_hand
    display_dealer_hand
  end

  def ask_human_choice
    input = nil
    loop do
      puts 'hit or stay???'
      input = gets.chomp.downcase
      break if @human.options.include?(input)
      puts 'Please enter valid choice'
    end
    if input == 'hit'
      card = @dealer.game_deck.deal_card
      display_delt_card(card)
      @human.hand << card
    end
  end

  def ask_dealer_choice
    if @dealer.current_hand_total < 17
      puts @dealer.current_hand_total
      puts 'the dealer hits'
      card = @dealer.game_deck.deal_card
      puts display_card(card)
      @dealer.hand << card
    else
      puts @dealer.current_hand_total
      puts 'The dealer has chosen to stay'
    end
  end

  def play
    setup_display
    calculate_hands
    display_players_hand_total
    display_dealer_hand_total

    ask_human_choice
    calculate_hands
    display_players_hand_total

    ask_dealer_choice

    # show hand
  end
end

GameEngine.new.play
