class CLI
  def call
    message = ["Welcome to the Redbull Team line up!",
        "Type 'list' to see all the players and their positions",
        "To quit, type 'exit'.",
        "What would you like to do?"]
    message.each{|phrase| puts phrase}
    input = gets.strip
    case input
    when "list"
      list_name
    when "exit"
      puts 'Exiting'
    end
  end

  def list_name
    Player.all.each_with_index{|player, i| puts "#{i+1}. #{player.name}\n    Position: #{player.position}"}
  end
end
