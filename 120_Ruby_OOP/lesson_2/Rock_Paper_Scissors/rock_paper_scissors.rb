require 'pry'

class Move
  VALUES = %w[rock paper scissors lizard spock]

  def initialize(value)
    @value = value
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value = 'spock'
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def reset_score
    @score = 0
  end
end

class Human < Player
  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end

  def set_name
    n = ''
    loop do
      puts 'What is your name?'
      n = gets.chomp
      break unless n.empty?
      puts 'Sorry must enter a value.'
    end
    self.name = n
  end
end

class Computer < Player
  def choose
    self.move = Move.new(Move::VALUES.sample)
  end

  def set_name
    self.name = %w[R2D2 Chappie Iron\ Giant RAM\ 2.0 Hal].sample
  end
end

# Game Engine
class RPSGame
  attr_accessor :human, :computer, :winner

  def initialize
    @human = Human.new
    @computer = Computer.new
    @winner = nil
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors #{human.name}."
  end

  def display_goodbye_message
    puts 'Thank you for playing. Good Bye!'
  end

  def display_moves
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      human.score += 1
      puts "#{human.name} won!"
    elsif human.move < computer.move
      computer.score += 1
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = ''
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp
      break if %w[y n].include?(answer.downcase)
      puts 'please pick y or n!'
    end
    answer.downcase == 'y' ? true : false
  end

  def display_scores
    puts "The current score is computer: #{computer.score} to #{human.name}: #{human.score}"
  end

  def calculate_scores
    @winner = human if human.score == 3
    @winner = computer if computer.score == 3
  end

  def display_champion_message
    puts "Congrats you're the winner!" if @winner == human
    puts "Better luck next time!"      if @winner == computer
  end

  def reset_champion
    @winner = nil
  end

  def turn_scoring
    calculate_scores
    display_scores
  end

  def game_cleanup
    reset_champion
    human.reset_score
    computer.reset_score
  end

  def play
    display_welcome_message

    # need to implement a way to set score and detect when a player reaches 10  # points
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        turn_scoring
        break unless winner.nil?
      end
      display_champion_message
      game_cleanup
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
