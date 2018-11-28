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
      player.age = players.css('div.birthdate span.stat.age').text
      player.height = players.css('div.stats_container span.stat.height').text
      player.weight = players.css('div.stats_container span.stat.weight').text
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
