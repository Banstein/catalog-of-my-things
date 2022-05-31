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
end