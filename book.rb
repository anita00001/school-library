require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = [] # Array to store rentals
  end

  def add_rental(person, date)
    Rental.new(person, self, date)
  end
end
