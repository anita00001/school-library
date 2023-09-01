require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_all_books
    puts "\n"
    puts 'Listing all books...'
    @books.each { |book| puts "Book: Title : #{book.title}, Author : #{book.author}" }
  end

  def list_all_people
    puts "\n"
    puts 'Listing all people...'
    @persons.each { |person| puts "Person: Name : #{person.name}, ID = #{person.id}" }
  end

  def create_person
    puts "\n"
    puts 'Creating a person...'
    puts 'Do you want to create a Student(1) or a Teacher(2)? [Input 1 or 2]: '
    person_type = gets.chomp.to_i

    if person_type == 1
      create_student
    elsif person_type == 2
      create_teacher
    else
      puts 'Invalid option, please try again'
    end
  end

  def create_teacher
    puts "\n"
    puts 'Creating a teacher...'
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @persons << teacher
    puts 'Teacher created successfully🚀'
  end

  def create_student
    puts "\n"
    puts 'Creating a student...'
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Classroom: '
    classroom = gets.chomp
    puts 'Has parent permission? [Y/N]: '
    has_parent_permission = gets.chomp.upcase
    if has_parent_permission != 'Y' && has_parent_permission != 'N'
      puts 'Invalid option, please try again'
    elsif has_parent_permission == 'Y'
      has_parent_permission = true
    elsif has_parent_permission == 'N'
      has_parent_permission = false
    end
    student = Student.new(classroom, age, name, has_parent_permission)
    @persons << student
    puts 'Student created successfully🚀'
  end

  def create_book
    puts "\n"
    puts 'Creating a book...'
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
  end

  def create_rental
    puts "\n"
    puts 'Creating a rental...'
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts 'Select a person from the following list by number (not id)'
    @persons.each_with_index { |person, index| puts "#{index}) Name: #{person.name}, ID: #{person.id}" }
    person_index = gets.chomp.to_i
    person = @persons[person_index]
    puts 'Date (yyyy-mm-dd): '
    date = gets.chomp
    @rentals << Rental.new(person, book, date)
    puts 'Rental created successfully🚀'
  end

  def list_rentals
    puts "\nListing rentals by person's id..."
    puts 'Please input the person id: '
    @persons.each { |person| puts "Person: ID = #{person.id}, Name : #{person.name}" }
    person_id = gets.chomp.to_i
    puts "\nRentals by ID #{person_id} are: "
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Book: #{rental.book.title}, Author: #{rental.book.author}, Date: #{rental.date}"
      end
    end
  end
end
