require_relative 'app'

def display
  puts "\n"
  puts 'Welcome to the School Library!'
  puts 'What would you like to do?'
  puts 'Please choose an option (Enter the number 1 - 7):'
  puts "\n"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person (Teacher or Student)'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  puts "\n"
end

def run_app(selected_option, app)
  case selected_option
  when 4
    app.create_book
  when 7
    puts '🙏Thanks for using this application. Goodbye!👋'
  else
    puts 'Invalid option, please try again'
  end
end

def main
  app = App.new
  loop do
    display
    selected_option = gets.chomp.to_i
    break if selected_option == 7

    run_app(selected_option, app)
  end
end

main
