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

puts "\n Verify decorator"
puts "The given name: #{person.correct_name}"
puts "Name Capitalized: #{capitalized_name.correct_name}"
puts "Name Trimmed: #{trimmed_name.correct_name}"

# Verify relationship between classroom and student
classroom_a = Classroom.new('Class A')
classroom_b = Classroom.new('Class B')

student1 = Student.new(classroom_a, 18, 'John Doe', parent_permission: true)
student2 = Student.new(classroom_a, 17, 'Alice', parent_permission: false)
student3 = Student.new(classroom_b, 16, 'Bob', parent_permission: false)
student4 = Student.new(classroom_b, 15, 'Carol', parent_permission: true)

# Verify has-many relationship (classroom has many students)
classroom_a.add_student(student1)
classroom_a.add_student(student2)
classroom_b.add_student(student3)
classroom_b.add_student(student4)

puts "\n Verify has-many relationship (classroom has many students)"
puts "#{classroom_a.label} students: #{classroom_a.students.map(&:name).join(', ')}"
puts "#{classroom_b.label} students: #{classroom_b.students.map(&:name).join(', ')}"

# Verify belongs-to relationship (student belongs to a classroom)
puts "\n Verify belongs-to relationship (student belongs to a classroom)"
puts "#{student1.name} belongs to #{student1.classroom.label}"
puts "#{student2.name} belongs to #{student2.classroom.label}"
puts "#{student3.name} belongs to #{student3.classroom.label}"


# Verify many-to-many relationship between Person and Book using Rental class
person1 = Person.new(25, 'John')
person2 = Person.new(19, 'Alice')
person3 = Person.new(30, 'Bob')

book1 = Book.new('Book 1', 'Author 1')
book2 = Book.new('Book 2', 'Author 2')
book3 = Book.new('Book 3', 'Author 3')

rental1 = Rental.new(person1, book1, '2023-08-01')
rental2 = Rental.new(person2, book1, '2023-08-05')
rental3 = Rental.new(person3, book2, '2023-08-10')
rental4 = Rental.new(person1, book3, '2023-08-15')

# Verify the has-many side of Book and Rental (a book has many rentals)
puts "\n Verify the has-many side of Book and Rental (a book has many rentals)"
puts "#{book1.title} rentals: #{book1.rentals.map(&:person).map(&:name).join(', ')}"
puts "#{book2.title} rentals: #{book2.rentals.map(&:person).map(&:name).join(', ')}"
puts "#{book3.title} rentals: #{book3.rentals.map(&:person).map(&:name).join(', ')}"

# Verify the belongs-to side of Rental and Book (a rental belongs to a book)
puts "\n Verify the belongs-to side of Rental and Book (a rental belongs to a book)"
puts "#{rental1.person.name}'s rental: #{rental1.book.title}"
puts "#{rental2.person.name}'s rental: #{rental2.book.title}"
puts "#{rental3.person.name}'s rental: #{rental3.book.title}"
puts "#{rental4.person.name}'s rental: #{rental4.book.title}"

# Verify the has-many side of Person and Rental (a person has many rentals)
puts "\n Verify the has-many side of Person and Rental (a person has many rentals)"
puts "#{person1.name}'s rentals: #{person1.rentals.map(&:book).map(&:title).join(', ')}"
puts "#{person2.name}'s rentals: #{person2.rentals.map(&:book).map(&:title).join(', ')}"
puts "#{person3.name}'s rentals: #{person3.rentals.map(&:book).map(&:title).join(', ')}"

# Verify the belongs-to side of Rental and Person (a rental belongs to a person)
puts "\n Verify the belongs-to side of Rental and Person (a rental belongs to a person)"
puts "#{rental1.book.title}'s renter: #{rental1.person.name}"
puts "#{rental2.book.title}'s renter: #{rental2.person.name}"
puts "#{rental3.book.title}'s renter: #{rental3.person.name}"
puts "#{rental4.book.title}'s renter: #{rental4.person.name}"
