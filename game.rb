class Game
  def initialize
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")
    @players = [@p1,@p2]
  end

  def question
    num1 = rand(1..20)
    num2 = rand(1..20)
    @total = num1 + num2
    @questioner = @players.first.name
    @current_player = @players.last
    puts "#{@questioner}: What does #{num1} plus #{num2} equal?"
  end

  def answer
    answer = gets.chomp.to_i
    if answer == @total
      puts "#{@questioner}: YES! You are correct."
    else
      puts "#{@questioner}: Seriously? No!"
      @current_player.lose_life
    end
  end

  def score
    puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3 "
  end

  def result
    @p2.loser? ? winner = @p1 : winner = @p2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
  end

  def game_over?
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def new_turn
    puts "----- NEW TURN -----"
    @players.reverse!
    return
  end

  def play
    while @p1.lives > 0 && @p2.lives > 0
      puts self.question
      puts self.answer
      puts self.score
      puts self.new_turn
    end
      puts self.result
      puts self.game_over?
  end

end