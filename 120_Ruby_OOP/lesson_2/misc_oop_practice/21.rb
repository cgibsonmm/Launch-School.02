# dealer takes a deck of cards shuffles cards and deals them to players,
# players take turn looking at cards and attempt to get as close as possible
# to 21 without busting

# rules house must hit at 15 or below,

require 'pry'

class Player
  attr_accessor :hand, :name

  def initialize
    @hand = []
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
  attr_accessor :game_deck
  NAMES = %w[bobby red timmy jimmy]

  def initialize
    super
    @name = set_name
    @game_deck = Deck.new
  end

  def set_name
    NAMES.sample
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

class GameEngine
  attr_accessor :human, :dealer

  def initialize
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
    puts "Your staring hand is:
          #{@human.hand[0][0]} of #{@human.hand[0][1]}
          and a #{@human.hand[1][0]} of #{@human.hand[1][1]}"
  end

  def display_dealer_hand
    puts "-" * 20
    puts "#{@dealer.name} is showing a #{@dealer.hand[1][0]} of #{@dealer.hand[1][1]}"
  end

  def setup_display
    display_names
    deal_starting_hand
    display_player_hand
    display_dealer_hand
    display_current_visable_totals
  end

  def display_current_visable_totals; end

  def play
    setup_display
    # show hand
  end
end

GameEngine.new.play
