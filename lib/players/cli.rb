#require_relative "../player.rb"
require_relative "./player.rb"
require_relative "./scraper.rb"
require 'pry'

class CLI
  def call
    welcome
    list_name
    puts "Wich player would you like to know more about"
    puts "Please select betwee 1 and #{Player.all.length}"
    puts "To quit, type 'exit'."
    input = gets.strip
    #if 0 < input && input < Player.all.length


    # case input
    # when "list"
    #   list_name
    # when "exit"
    #   puts 'Exiting'
    # end
  end
  def welcome
    puts "Welcome to the Redbull Team line up!"
  end
  def list_name
    Player.all.each_with_index{|player, i| puts "#{i+1}. #{player.name}\n    Position: #{player.position}"}
    #binding.pry
  end
end

CLI.new.call
