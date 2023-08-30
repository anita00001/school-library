require_relative 'person'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
    classroom.add_student(self) # Add the current student to the classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
