class Genre 
  extend Concerns::Findable
  attr_accessor :name 
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    save
  end 
  
  def songs 
    @songs
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def self.create(genre_name)
    new_genre = self.new(genre_name)
    new_genre.save
    new_genre
  end 
  
  def artists
    songs.collect {|g| g.artist}.uniq
  end 
  
end 