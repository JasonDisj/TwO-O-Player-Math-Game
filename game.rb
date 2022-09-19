require './player.rb'

class Game
  def initialize
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")
    @players = [@p1, @p2]
  end

  def question
    num1 = rand(1..20)
    num2 = rand(1..20)
    @questioner = @players.first.name
    @answerer = @players.last
    @total = num1 + num2
    puts "#{@questioner}: What does #{num1} plus #{num2} equal?"
  end

  def answer
    answer = gets.chomp.to_i
    if answer == @total
      puts "#{@questioner}: YES! You are correct."
    else
      puts "#{@questioner}: Seriously? No!"
      @answerer.lose_life
    end
  end

  def score
    puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3 "
  end

  def game_over?
    puts "----- GAME OVER -----"
  end

  def result
    @p2.loser? ? winner = @p1 : winner = @p2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
  end

  def play
    while @p1.lives > 0 && @p2.lives > 0
      puts self.question
      puts self.answer
      puts self.score
  end

end