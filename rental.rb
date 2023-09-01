class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    person.rentals << self # Add the current rental to the person's rentals list
    book.rentals << self # Add the current rental to the book's rentals list
  end
end
