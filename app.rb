require_relative './genre'
require_relative './music_album'
require_relative './file_manager'

class App
  attr_reader :genre_list, :music_album_list, :game

  def initialize
    @genre_list = []
    @music_album_list = []
    @game = []
  end

  def save_files
    instance_variables.each do |var|
      file = []
      file_name = var.to_s.delete('@')
      instance_variable_get(var).each do |obj|
        file.push({ ref: obj, value: to_hash(obj) })
      end
      save_file("./data/#{file_name}.json", file) if var.size.positive?
    end
  end

  def recover_files
    genre_file = get_file('./data/genre_list.json')
    music_album_file = get_file('./data/music_album_list.json')
    game_file =('./data/game.json')
    recover_genre(genre_file)
    recover_music_list(music_album_file)
    recover_game(game_file)
  end

  def to_hash(object)
    hash = {}
    object.instance_variables.each do |var|
      hash[var.to_s.delete('@')] = object.instance_variable_get(var)
    end
    hash
  end
  
  def add_game(date, archived, multiplayer, last_played_at)
    new_game = Game.new(date, archived, multiplayer, last_played_at)
    game.push(new_game)
  end

  def add_genre(name)
    genre = Genre.new(name)
    genre_list.push(genre)
  end

  def add_music_album(date, spotify)
    music_album = MusicAlbum.new(date, spotify)
    music_album_list.push(music_album)
  end

  def display_genre
    @genre_list.each { |genre| puts "Name: #{genre.name}" }
  end

  def display_music_album
    @music_album_list.each { |music_genre| puts "Date: #{music_genre.date}, On Spotify: #{music_genre.date}" }
  end

  def recover_genre(hash)
    hash.each do |genre|
      current_genre = genre['value']
      name = current_genre['name']
      add_genre(name)
    end
  end

  def recover_books(hash)
    hash.each do |music_album|
      current_album = music_album['value']
      date = current_album['date']
      archived = current_album['archived']
      on_spotify = current_album['on_spotify']
      add_book(date, archived, on_spotify)
    end
  end

  def recover_game(hash)
    hash.each do |game|
      current_game = game['value']
      date = current_game['date']
      archived = current_game['archived']
      multiplayer = current_game['multiplayer']
      last_played_at= current_game['last_played_at']
      add_game(date, archived, multiplayer, last_played_at)
    end
  end
end
