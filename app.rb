require './genre'

class App

  attr_reader :genre_list, :music_album_list

  def initialize
    @genre_list = []
    @music_album_list = []
  end

  def add_genre(name)
    genre = Genre.new(name)
    genre_list.push(genre)
  end

  def add_music_album(date)
    music_album = MusicAlbum.new(date)
    music_album_list.push(music_album)
  end

  def display_genre
    @genre_list.each { |genre| puts "Name: \"#{book.title}\"}" }
  end
end