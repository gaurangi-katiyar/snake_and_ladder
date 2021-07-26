#code for snake and ladder
@players = []
@current_position = []
@snake_pos =[[37,1],[25,5],[47,9],[65,59],[99,62],[87,54],[92,69]]
@ladder_pos = [[2,60],[6,27],[11,51],[35,56],[63,96],[68,88]]
puts "Enter number of players"
number=gets.chomp.to_i
i=1
var ='a'
while i <= number
  @players << var
  @current_position << 0
  i=i+1
  var = var.next
end
i=0
def move(p)
  position = p
  temp = 1+ rand(6)
  puts "The dice rolled #{temp}"
  position = position + temp
  if position > 100
    print("Sorry. This move cannot be counted")
    position-=temp
  end

  if position == 100
    return position
  end

  @snake_pos.each do |j| 
    if position==j[0]
      print("Oops!! You landed on a snake")
      position = j[1]
    end
  end

  @ladder_pos.each do |j| 
    if position==j[0]
      print("Hurrayy!! You just climbed a ladder")
      position = j[1]
    end
  end
  return position
end

def play
  i=0
  puts
  puts "The current positions of player are"
  @current_position.each do |j|
    puts "Player #{@players[i]} is at position #{j}"
    i+=1
  end
end
var = 0
puts("Starting the game of Snake and Ladder")
play

while var <= 100 
  i=0
  @players.each do |j|
    puts
    puts "press y to roll the dice"
    input=gets.chomp.downcase
    if input == "y"
      puts "Rolling dice for Player #{j}"
      var = move(@current_position[i])
      if var == 100
        puts "Player #{j} is the winner"
        break
      end
      @current_position[i]= var
      play
    end
    i= i+1
  end
  if var == 100
    break
  end
end
