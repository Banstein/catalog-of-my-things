require './app'

def display_app
  puts "\nPlease choose an option by entering a number:"
  puts ['1 - List all books', '2 - List all music album', '3 - List all genre',
        '4 - List all labels', '5 - List all movies', '6 - List all Sources',
        '7 - Add genre', '8 - Add label', '9 - Add a book',
        '10 - Add a music album', '11 - Add a movie', '12 - Exit']
end

def take_action(app)
  decision = gets.chomp
  puts 'Please choose one of the options on the list' unless '123456789"10""11""12"'.include?(decision)
  decision == '12' && exit_program
  methods = [method(:display_books), method(:display_music_album), method(:display_genre),
             method(:display_labels), method(:display_movies), method(:display_sources),
             method(:add_genre), method(:add_label), method(:add_book),
             method(:add_music_album), method(:add_movie)]
  '12345678'.include?(decision) && methods[decision.to_i - 1].call(app)
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
