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

def run_app(app)
  input_options = {
    '1' => :list_all_books,
    '2' => :list_all_people,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_rentals,
    '7' => :exit_apps
  }
  loop do
    display
    selected_option = gets.chomp
    if selected_option == '7'
      exit_app
    elsif input_options.key?(selected_option)
      app.send(input_options[selected_option])
    end
  end
end

def exit_app
  puts '🙏Thanks for using this application🙏 Goodbye!👋'
  puts "\n"
  exit
end

def main
  app = App.new
  run_app(app)
end

main
