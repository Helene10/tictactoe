class Board

  attr_accessor :cases

  
  def initialize
    @cases = []
    for i in (1..9)
      @cases << BoardCase.new(i.to_s)
    end
  end

  def plateau
    under = "_"
    barre = "|"
    space = " "
    puts space * 30 + barre + space * 5 + barre
    puts space * 28 + @cases[0].value + space + barre + space*2 + @cases[1].value + space*2 + barre + space*2 + @cases[2].value
    puts space * 30 + barre + space * 5 + barre
    puts space * 25 + under * 18
    puts
    puts space * 30 + barre + space * 5 + barre
    puts space * 28 + @cases[3].value + space + barre + space*2 + @cases[4].value + space*2 + barre + space*2 + @cases[5].value
    puts space * 30 + barre + space * 5 + barre
    puts space * 25 + under * 18
    puts
    puts space * 30 + barre + space * 5 + barre
    puts space * 28 + @cases[6].value + space + barre + space*2 + @cases[7].value + space*2 + barre + space*2 + @cases[8].value
    puts space * 30 + barre + space * 5 + barre
    puts 
  end
  
  def play(move, result)
    @cases[move - 1].value = result
  end

  def position_taken?(move)
    if @cases[move - 1].value == 'X' || @cases[move - 1].value == 'O'
      true
    else
      false
    end
  end

      
end

class BoardCase

  attr_accessor :value

  def initialize(value)
    @value = value
  end
  
  def to_s
    @value
  end
end


class Game
  attr_accessor :players, :board

  def initialize
    
    
    puts "Quel est le nom du premier joueur ""son saymbole sera le #{'X'}) :"
    print '> '
    player_1_name = gets.chomp
    player_1 = Player.new(player_1_name, 'X')
    puts '_' * 37
    puts
    puts "Nom du deuxieme joueur ? ""son symbole sera le #{'O'}) :"
    print '> '
    player_2_name = gets.chomp
    player_2 = Player.new(player_2_name, 'O')
    @players = [player_1, player_2]
    @board = Board.new
  end

  def start_game

    9.times do |turn|
  
        turns(turn)
   
    end
      
  end

  def turns(i)
    system('clear')
    @board.plateau
    a = i % 2
    puts "#{@players[a].name}, joue un chiffre entre 1 et 9 ?"
    move = gets.chomp.to_i
  
    @board.play(move, @players[a].symbol)
    @board.plateau
  end

end


class Player
  attr_accessor :name ,:symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end



end

Game.new.start_game
