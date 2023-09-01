require_relative 'book'

class App
  def initialize
    @books = []
  end

  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
  end
end
