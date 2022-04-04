class Player
  def initialize
    @lives = 3
  end
  
  attr_accessor :lives
end

class Game
  @currentPlayer = 0

  def initialize
    @players = [Player.new, Player.new]
  end

  attr_reader :players

  def switchPlayers
    @currentPlayer = (@currentPlayer == 1 ? 0 : 1)
  end

  def question
    nums = [1 + rand(20), 1 + rand(20)]

    puts "----- NEW TURN -----"
    print "Player #{@currentPlayer.to_i + 1}: What does #{nums[0]} plus #{nums[1]} equal? \n> "
    input = gets.chomp

    if input.to_i == nums[0] + nums[1]
      puts "Player #{@currentPlayer.to_i + 1}: YES! You are correct."
    else
      puts "Player #{@currentPlayer.to_i + 1}: Seriously? No!"
    end

    @players[@currentPlayer.to_i].lives -= (nums[0] + nums[1] == input.to_i) ? 0 : 1

    self.scores
    self.switchPlayers
  end

  def scores
    if (@players[0].lives == 0 || @players[1].lives == 0)
      winner = @players[0].lives == 0 ? 1 : 0;
      puts "Player #{winner.to_i + 1} wins with a score of #{self.players[winner].lives}/3"
    else
      puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
    end
  end

  def finished?
    return @players[0].lives == 0  || @players[1].lives == 0
  end
end