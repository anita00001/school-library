require_relative 'nameable'
require_relative 'base_decorator'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private :of_age?
end

person = Person.new(22, 'maximilianus')
puts "The given name: #{person.correct_name}"

capitalized_name = Capitalize.new(person)
puts "Name Capitalized: #{capitalized_name.correct_name}"

trimmed_name = Trimmer.new(capitalized_name)
puts "Name Trimmed: #{trimmed_name.correct_name}"
