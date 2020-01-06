class Song 
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre 
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil 
      self.artist = artist 
    end 
    
    if genre != nil 
      self.genre = genre 
    end 
    
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
  
  def self.create(song_name)
    new_song = self.new(song_name)
    new_song.save
    new_song
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self if !genre.songs.include?(self)
  end 
  
  def self.new_from_filename(file_name)
    a, s, g = file_name.chomp(".mp3").split(" - ")
    artist_name = Artist.find_or_create_by_name(a)
    genre_name = Genre.find_or_create_by_name(g)
    Song.new(s, artist_name, genre_name)
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end 

end 