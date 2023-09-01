require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @persons = []
  end

  def list_all_books
    puts "\n"
    puts 'Listing all books...'
    @books.each { |book| puts "Book: Title : #{book.title}, Author : #{book.author}" }
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
    elsif has_parent_permission === 'Y'
      has_parent_permission = true
    elsif has_parent_permission === 'N'
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
end
