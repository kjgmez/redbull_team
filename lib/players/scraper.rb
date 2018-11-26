#require_relative "../player.rb"
require_relative "./player.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper
  def get_page_player
    doc = Nokogiri::HTML (open("https://www.newyorkredbulls.com/players"))
  end

  def get_players
    self.get_page_player.css('li.row')
  end
  def make_player
    self.get_players.collect do |players|
      player = Player.new
      player.name = players.css('div.player_info div.name a').children.first.text
      player.position = players.css('div.player_info span.position').children.first.text
      profile = players.css('div.player_info div.name a').attribute('href').value
      #docs = Nokogiri::HTML (open("https://www.newyorkredbulls.com#{profile}"))
      #bio = docs.css('div.player_info_alternate.section')
      #player.age = bio.css("div.age").text.split("\n").join(' ')
      #player.home = bio.css("div.hometown").text.split("\n").join(' ')
      #binding.pry
    end
  end
# def print_players
#   self.make_player
#   Player.all.each  do |player|
#     puts "name: #{player.name}"
#     puts "position: #{player.position}"
#   end
# end
end

Scraper.new.make_player
