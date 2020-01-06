require 'pry'
class Artist 
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
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
  
  def self.create(artist_name)
    new_artist = self.new(artist_name)
    new_artist.save 
    new_artist
  end 
  
  def add_song(song_name)
    if song_name.artist != nil 
      song_name.artist 
    elsif song_name.artist == nil 
      song_name.artist = self 
      songs << song_name
    end 
  end 
  
  def genres 
    @songs.collect {|artist_song| artist_song.genre}.uniq
  end 
  
end 




