class Play

  def initialize(players)
    @arr = []
    @arr = players
    @snake_pos =[[37,1],[25,5],[47,9],[65,59],[99,62],[87,54],[92,69]]
    @ladder_pos = [[2,60],[6,27],[11,51],[35,56],[63,96],[68,88]]
    @var = 0
  end

  def move(p)
    position = p
    temp = 1+ rand(6)
    puts "The dice rolled #{temp}"
    position = position + temp
    if position > 100
      puts("Sorry. This move cannot be counted")
      position-=temp
    end

    if position == 100
      return position
    end

    @snake_pos.each do |j| 
      if position==j[0]
        puts("Oops!! You landed on a snake")
        position = j[1]
      end
    end

    @ladder_pos.each do |j| 
      if position==j[0]
        puts("Hurrayy!! You just climbed a ladder")
        position = j[1]
      end
    end
    return position
  end

  def position_of_player
    puts "The current positions of player are"
    @arr.each do |j|
      puts "Player #{j.name} is at position #{j.position}"
    end
  end
  def chance
    while @var <= 100 
      @arr.each do |j|
        puts
        puts "press y to roll the dice"
        input=gets.chomp.downcase
        if input == "y"
          puts "Rolling dice for Player #{j.name}"
          @var = move(j.position)
          if @var == 100
            puts "Player #{j.name} is the winner"
            break
          end
          j.position= @var
          position_of_player
        end
      end
      if @var == 100
        break
      end
    end

  end
end

class Players
  def initialize(name="",position = 0)
    @name = name
    @position = position
  end
  def name=(name)
    @name = name
  end
  def position=(position)
    @position = position
  end
  def name
    @name
  end
  def position
    @position 
  end
end

puts "Enter number of players"
number=gets.chomp.to_i
players = []
number.times do 
  players << Players.new()
end
puts "Enter name for each player"
players.each do |i|
  i.name = gets.chomp
end

start = Play.new(players)
start.chance
