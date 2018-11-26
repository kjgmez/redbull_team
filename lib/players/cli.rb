class CLI
  def call
    welcome
    list_name
    puts "Wich player would you like to know more about"
    ask_for_input
    until @input == "exit"
      more_info
      ask_for_input
    end 
  end
  def welcome
    puts "Welcome to the Redbull Team line up!"
  end
  def list_name
    Player.all.each_with_index{|player, i| puts "#{i+1}. #{player.name}"}
    #binding.pry
  end
  def ask_for_input
    puts "Please select between 1 and #{Player.all.length}"
    puts "To quit, type 'exit'."
    @input = gets.strip
    @input == 'exit' ? goodbye : check_for_input
  end
  def goodbye
    puts "Thanks for visiting the NYC Redbull Soccer team"
  end
  def check_for_input
    until @input.match(/^(\d)+$/) && @input.to_i.between?(0, Player.all.length)
      puts "Please enter a valid number"
      ask_for_input
    end
  end
  def more_info
    #binding.pry
    player = Player.all[@input.to_i - 1]
    puts "Player info is as follows:\n Position: #{player.position}\n Age: #{player.age}\n Height: #{player.height}"
  end
end
