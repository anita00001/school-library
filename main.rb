# Verification

require_relative 'person'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'
require_relative 'student'
require_relative 'classroom'

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
