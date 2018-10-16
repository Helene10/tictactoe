class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)
attr_accessor :valeur, :numero

  
  def initialize(numero, valeur)
    #TO DO doit régler sa valeur, ainsi que son numéro de case
    @valeur = valeur
    @numero = numero 

  end
  
  def to_s
  #TO DO : doit renvoyer la valeur au format string
    
    @valeur.to_s
  end

end

class Board
  include Enumerable
  
  attr_accessor :nombre_cases

  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases


  def initialize
    
  #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
    
    @nombre_cases = []
    for i in (1..9) 
    @nombre_cases << BoardCase.new(i, "") 
    end
  
  

  def plateau(array)
  #TO DO : afficher le plateau
    puts "Voici votre plateau de jeu"


    puts " #{array[0].numero} | #{array[1].numero} | #{array[2].numero} "
    puts "---|---|---"
    puts " #{array[3].numero} | #{array[4].numero} | #{array[5].numero} "
    puts "---|---|---"
    puts " #{array[6].numero} | #{array[7].numero} | #{array[8].numero} "
  end  
   plateau(@nombre_cases)
   
end


  def play(nombre)
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)

array2 = []
 @nombre_cases.each do |une_case|
array2 << une_case.numero  
end 
puts array2
puts plateau(array2)


  end

  #def victory?
    #TO DO : qui gagne ?
  #end
end



class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?
  attr_accessor :nom, :symbole
  attr_writer :victoire
  
  def initialize(nom, symbole)
 
 #TO DO : doit régler son nom, sa valeur, son état de victoire
    
    puts "quel est ton nom ?"   
    @nom = gets.chomp
 

    @symbole = symbole
    puts "ton symbole est le #{@symbole}"
end

  end



class Game
  def initialize
    #TO DO : créé 2 joueurs, créé un board
    @player1 = Player.new(@nom, "0")
    @player2 = Player.new(@nom, "X")
    @nouveau_jeu = Board.new
    

  end



    
  def go
  turn
  end


  def turn
   
    #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie

 puts  "quelle case veux tu jouer, #{@player1.nom} ?"
  l = gets.chomp.to_i

@nouveau_jeu.play(l)

 puts  "quelle case veux tu jouer, #{@player2.nom} ?"
  m = gets.chomp.to_i


  end

end

Game.new.go 