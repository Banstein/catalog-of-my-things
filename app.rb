require_relative './genre'
require_relative './music_album'
require_relative './file_manager'
require_relative './game'
require_relative './author'
require_relative './label'
require_relative './book'

class App
  attr_reader :genre_list, :music_album_list, :game, :authors, :book, :label

  def initialize
    @genre_list = []
    @music_album_list = []
    @game = []
    @authors = []
    @label = []
    @book = []
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
    game_file = get_file('./data/game.json')
    author_file = get_file('./data/authors.json')
    label_file = get_file('./data/label.json')
    book_file = get_file('./data/book.json')
    recover_genre(genre_file)
    recover_music_list(music_album_file)
    recover_game(game_file)
    recover_author(author_file)
    recover_label(label_file)
    recover_book(book_file)
  end

  def to_hash(object)
    hash = {}
    object.instance_variables.each do |var|
      hash[var.to_s.delete('@')] = object.instance_variable_get(var)
    end
    hash
  end

  def add_author(first_name, last_name)
    author = Author.new(first_name, last_name)
    authors.push(author)
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

  def add_label(title, color)
    label = Label.new(title, color)
    label.push(label)
  end

  def add_book(publisher, cover_state, publish_date)
    book = Book.new(publisher, cover_state, publish_date)
    book.push(book)
  end

  def display_genre
    @genre_list.each { |genre| puts "Name: #{genre.name}" }
  end

  def display_music_album
    @music_album_list.each { |music_genre| puts "Date: #{music_genre.date}, On Spotify: #{music_genre.date}" }
  end

  def display_games
    @game.each { |game| puts "Date: #{game.publish_date}, last played at #{game.last_played_at}" }
  end

  def display_authors
    @authors.each { |author| puts "Author Name: #{author.first_name} #{author.last_name}" }
  end

  def display_label
    @label.each { |label| puts "Title: #{label.title}, Color: #{label.color}" }
  end

  def display_book
    @book.each do |book|
      puts "Publisher: #{book.publisher}, Cover state: #{book.cover_state}, Date: #{book.publish_date}"
    end
  end

  def recover_genre(hash)
    hash.each do |genre|
      current_genre = genre['value']
      name = current_genre['name']
      add_genre(name)
    end
  end

  def recover_music_list(hash)
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
      last_played_at = current_game['last_played_at']
      add_game(date, archived, multiplayer, last_played_at)
    end
  end

  def recover_author(hash)
    hash.each do |author|
      current_author = author['value']
      first_name = current_author['first_name']
      last_name = current_author['last_name']
      add_author(first_name, last_name)
    end
  end

  def recover_label(hash)
    hash.each do |label|
      current_label = label['value']
      title = current_label['title']
      color = current_label['color']
      add_label(title, color)
    end
  end

  def recover_book(hash)
    hash.each do |book|
      current_book = book['value']
      publisher = current_book['title']
      cover_state = current_book['cover_state']
      publish_date = current_book['publish_date']
      add_book(publisher, cover_state, publish_date)
    end
  end
end

app = App.new
puts app.display_authors