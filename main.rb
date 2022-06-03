require './app'

def display_app
  puts "\nPlease choose an option by entering a number:"
  puts ['1 - List all books', '2 - List all music album', '3 - List all genre',
        '4 - List all labels', '5 - List all games', '6 - List all authors',
        '7 - Add genre', '8 - Add label', '9 - Add a book',
        '10 - Add a music album', '11 - Add a game','12 - Add author', '13 - Exit']
end

def take_action(app)
  decision = gets.chomp
  puts 'Please choose one of the options on the list' unless '123456789"10""11""12"'.include?(decision)
  decision == '13' && exit_program
  methods = [method(:display_books), method(:display_music_album), method(:display_genre),
             method(:display_labels), method(:display_games), method(:display_authors),
             method(:add_genre), method(:add_label), method(:add_book),
             method(:add_music_album), method(:add_game), method(:add_author)]
  '123456789"10""11"'.include?(decision) && methods[decision.to_i - 1].call(app)
end

def display_books(app)
  "Books"
end

def display_labels(app)
  "labels"
end

def display_games(app)
  "games"
end

def display_authors(app)
  "authors"
end

def display_genre(app)
  app.display_genre
end

def display_music_album(app)
  app.display_music_album
end

def add_genre(app)
  print "\nName of Genre: "
  name = gets.chomp
  app.add_genre(name)
  puts 'Genre added successfully'
end

def add_label(app)
  puts 'Still to add label method'
end

def add_book(app)
  puts 'Still to add book method'
end

def add_game(app)
  puts 'Enter published date [day-month-Year]'
  date = gets.chomp
  puts "Is the game archived [y/n]"
  archived = gets.chomp.downcase
  archived == "n" ? arch_bool= true : arch_bool =false
  puts "Is the game multiply [y/n]"
  multiplayer = gets.chomp.downcase
  multiplayer == "n" ? mult_bool= true : mult_bool =false
  puts "Enter last played at data [day-month-Year]"
  last_played = gets.chomp
  app.add_game(date, arch_bool, mult_bool, last_played)
  app.save_files
end

def add_author(app)
  puts 'Still to add author method'
end

def on_spotify?(spotify_value)
  on_spotify = false
  spotify = spotify_value.capitalize
  on_spotify = true if spotify.include?('Y')
  on_spotify
end

def add_music_album(app)
  print "\nEnter music album date in day-month-year format: "
  date = gets.chomp
  print "\nOn spotify? [y/n]: "
  spotify_value = gets.chomp
  spotify = on_spotify?(spotify_value)
  app.add_music_album(date, spotify)
  puts 'Music album added successfully'
end

def exit_program
  puts 'Thank you for using this app!'
  exit
end

def main
  puts 'Welcome to your catalog of things!'
  app = App.new
  loop do
    display_app
    take_action(app)
  end
end

main
