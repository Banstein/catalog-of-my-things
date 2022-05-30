def display_app
 puts "\nPlease choose an option by entering a number:"
 puts ['1 - List all books', '2 - List all music album' '3 - List all genre' '4 - List all labels', '5 - Add a book', '6 - Add a music album', '7 - Add genre', '8 - Add label', '9 - Exit']
end


def take_action
  decision = gets.chomp
  puts 'Please choose one of the options on the list' unless '123456789'.include?(decision)
  decision == '9' && exit_program
  methods = [
    method(:display_books), method(:display_people), method(:create_people),
    method(:create_book), method(:handle_rental), method(:list_rental_for_person)
  ]
  '123456'.include?(decision) && methods[decision.to_i - 1].call(app)
end

def main
  puts 'Welcome to your catalog of things!'
  display_app
end

main