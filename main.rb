def display_app
 puts "\nPlease choose an option by entering a number:"
 puts ['1 - List all books', '2 - List all music album' '3 - List all genre' '4 - List all labels', '5 - Add a book', '6 - Add a music album', '7 - Add genre', '8 - Add label']
end

def main
  puts 'Welcome to your catalog of things!'
  display_app
end

main