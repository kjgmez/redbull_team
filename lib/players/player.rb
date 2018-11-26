class Player
  attr_accessor :name, :position, :age, :height, :weight
  @@all = []
  def initialize
    self.class.all << self
  end
  def self.all
    @@all
  end
  def self.reset_all
    self.all.clear
  end
  def self.count
    self.all.length
  end
end
