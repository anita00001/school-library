# Verification

require_relative 'person'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'

require_relative 'student'
require_relative 'classroom'

require_relative 'book'
require_relative 'rental'
require 'date'

# Verify decorator
person = Person.new(22, 'maximilianus')
capitalized_name = Capitalize.new(person)
trimmed_name = Trimmer.new(capitalized_name)

puts "The given name: #{person.correct_name}"
puts "Name Capitalized: #{capitalized_name.correct_name}"
puts "Name Trimmed: #{trimmed_name.correct_name}"

# Verify relationship between classroom and student
math_classroom = Classroom.new('Math Class')
student = Student.new(math_classroom, 16, 'Alice')

puts "#{student.name}'s classroom: #{student.classroom.label}"  # Access the student's classroom attribute
puts "#{math_classroom.label} students: #{math_classroom.students.map(&:name).join(', ')}"  # Access the classroom's students list

# Verify many-to-many relationship between Person and Book using Rental class
person1 = Person.new(22, 'John Doe')
person2 = Person.new(19, 'Jane Smith')

book1 = Book.new('The Martian', 'Andy Weir')
book2 = Book.new('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling')

rental1 = person1.add_rental(book1, Date.new(2023, 8, 30))
rental2 = person1.add_rental(book2, Date.new(2023, 8, 28))
rental3 = person2.add_rental(book1, Date.new(2023, 8, 25))

# Display rentals for person
puts "#{person1.name} rents: #{rental1.book.title} (Rented on #{rental1.date})"
puts "#{person2.name} rents: #{rental3.book.title} (Rented on #{rental3.date})"

# Display rentals for book
puts "#{book1.title} rentals: #{rental1.person.name} (Rented on #{rental1.date})"
puts "#{book1.title} rentals: #{rental3.person.name} (Rented on #{rental3.date})"
