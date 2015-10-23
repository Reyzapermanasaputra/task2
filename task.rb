class Player
  attr_accessor :name, :blood, :manna 
  
  def initialize(name)
    @name = name
    @blood = 100
    @manna = 40
  end 
  
  def self.play
    @players = []
    @i = 0
    while @i < 10
      welcome = <<-STR
    # ============================== #
    # Welcome to the Battle Arena #
    # ------------------------------------------------- ---- #
    # Description: #
    # 1 type "new" to create a character #
    # 2. type "start" to begin the fight #
    # ------------------------------------------------- ---- #
    STR
    puts welcome
    print "    type your choice : "
    input_menu = gets.chomp.to_str
    if input_menu.eql? "new"
      Player.new_player
    elsif input_menu.eql? "start"
      Player.start
    else
      10.times { puts "\t you maybe wrong type" }
    end
    @i += 1
    end 
  end
  
  def self.new_player
    print "\t add player : "
    input_player = gets.chomp
    @players << Player.new(input_player)
    if @players.size <= 3
      @players.each do |player|
        puts "\t #current player #"
        puts "\t #---------------------------------#"
        puts "\t #--- name  : #{player.name} ---#"
        puts "\t #--- blood : #{player.blood}---#"
        puts "\t #--- Manna : #{player.manna}---#"
        puts "\t #--------------------------------#"
      end
    else
        10.times { puts "\t maximum player" }
    end
  end
  
  def self.start
    loop = 0
    while loop < 5
    puts "\t --- Battle Start ---"
    if @players.size > 1
      print "\t who will attack : "
      @input_attack = gets.chomp.to_str
      print "\t who will be attacked :  "
      @input_attacked = gets.chomp.to_str
      Player.description
      Player.attack
      puts "=" * 10
      Player.attacked
      puts "=" * 10
    else
      10.times {puts "The player is not found"}
    end
    end
  end
  
  def self.attack
      check = 0
      while check < @players.size
        if @players[check].name.eql? @input_attack
          puts "\t name attacker  : #{@players[check].name}"
          puts "\t blood attacker : #{@players[check].blood}"
          puts "\t manna attacker : #{@players[check].manna -= 20}"
        end
        if @players[check].manna == 0 || @players[check].blood == 0
          Player.game_over
        end
        check += 1
      end
  end
  
  def self.attacked
      check = 0
      while check < @players.size
        if @players[check].name.eql? @input_attacked
          puts "\t name attacked  : #{@players[check].name}"
          puts "\t blood attacked : #{@players[check].blood -= 20}"
          puts "\t manna attacked : #{@players[check].manna}"
        end
        if @players[check].manna == 0 || @players[check].blood == 0
          puts @player[check].name 
          Player.game_over
        end
        check += 1
      end
  end
   
   def self.description
     puts "\n"
     puts "\t ---Description --- "
     puts "=" * 10
   end
   
   def self.game_over
       puts "game over"
       Player.play
   end
end

Player.play
