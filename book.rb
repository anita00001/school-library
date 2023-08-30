class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = [] # Array to store rentals
  end

  def add_rental(rental)
    @rentals << rental
  end
end
