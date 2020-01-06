class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    @path = path 
    new_path = MusicImporter.new(path)
    new_path.import
  end 
  
  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip
    
  end 
  
  def list_songs
    Song.all.sort do |ele1, ele2|
      ele1.name <=> ele2.name
    end.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end 
  
  def list_artists
    Artist.all.sort do |art1, art2|
      art1.name <=> art2.name
      # binding.pry
    end.uniq.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
      
    end 
  end 
  
  def list_genres
    Genre.all.sort {|gen1, gen2| gen1.name <=> gen2.name}.uniq.each.with_index(1) {|genre, i| puts "#{i}. #{genre.name}"}
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"

    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
  
end 