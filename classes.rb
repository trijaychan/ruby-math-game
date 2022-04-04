class Player
  def initialize
    @lives = 3
  end
  
  attr_accessor :lives
end

class Question
  def initialize(player)
    @player = player
    @nums = [1 + rand(20), 1 + rand(20)]
    @answer = @nums[0] + @nums[1]
  end

  def ask
    puts "----- NEW TURN -----"
    print "Player #{@player}: What does #{@nums[0]} plus #{@nums[1]} equal? \n> "
    input = gets.chomp

    return input.to_i
  end

  def correct?(input)
    puts "Player #{@player}: " + (input.to_i == @answer ? "YES! You are correct." : "Seriously? No!")
    return input.to_i == @answer 
  end
end

class Game
  @currentPlayer = 0

  def initialize
    @players = [Player.new, Player.new]
  end
  
  def start
    while !self.finished?
      question = Question.new(@currentPlayer.to_i + 1)
      input = question.ask

      @players[@currentPlayer.to_i].lives -= question.correct?(input) ? 0 : 1

      self.scores
      @currentPlayer = (@currentPlayer == 1 ? 0 : 1)
    end
  end

  def scores
    if (@players[0].lives == 0 || @players[1].lives == 0)
      winner = @players[0].lives == 0 ? 1 : 0;
      puts "Player #{winner.to_i + 1} wins with a score of #{@players[winner].lives}/3"
    else
      puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
    end
  end

  def finished?
    return @players[0].lives == 0  || @players[1].lives == 0
  end
end