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
    input = Integer(gets) rescue nil
    # if input != nil && 0 < input && input < Player.all.length
    #   puts "Player age and birtday is #{Player.all[input.to_i - 1].age}."
    # else
    #   puts "Please enter a valid number"
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
