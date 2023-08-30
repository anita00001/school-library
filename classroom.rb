class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []   # Initialize an empty array to store students
  end

  def add_student(student)
    @students << student
  end
end
