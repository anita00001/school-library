class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(person, book, date)
    @date = date
    @person = person
    @book = book
    book.add_rental(self) # Add this rental to the book's rentals array
  end
end
