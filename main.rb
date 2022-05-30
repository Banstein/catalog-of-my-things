def display_app
  puts "\nPlease choose an option by entering a number:"
  puts ['1 - List all books', '2 - List all music album', '3 - List all genre', '4 - List all labels', '5 - Add a book',
        '6 - Add a music album', '7 - Add genre', '8 - Add label', '9 - Exit']
end

def take_action
  decision = gets.chomp
  puts 'Please choose one of the options on the list' unless '123456789'.include?(decision)
  decision == '9' && exit_program
end

def exit_program
  puts 'Thank you for using this app!'
  exit
end

def main
  puts 'Welcome to your catalog of things!'
  display_app
  take_action
end

main
