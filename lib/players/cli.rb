#require_relative "../player.rb"
# require_relative "./player.rb"
# require_relative "./scraper.rb"
# require 'pry'

class CLI
  def call
    welcome
    list_name
    puts "Wich player would you like to know more about"
    puts "Please select betwee 1 and #{Player.all.length}"
    puts "To quit, type 'exit'."
    input = Integer(gets) rescue nil
    more_info(input)
  end
  def welcome
    puts "Welcome to the Redbull Team line up!"
  end
  def list_name
    Player.all.each_with_index{|player, i| puts "#{i+1}. #{player.name}"}
    #binding.pry
  end
  def more_info(input)
    if input != nil && 0 < input && input < Player.all.length
      #binding.pry
      puts "Player info is as follows:\n Position: #{Player.all[input.to_i - 1].position}\n Age: #{Player.all[input.to_i - 1].age}\n Height: #{Player.all[input.to_i - 1].height}"
    else
      puts "Please enter a valid number"
    end
  end
end

CLI.new.call
