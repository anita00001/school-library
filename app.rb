require_relative 'book'

class App
  def initialize
    @books = []
  end

  def list_all_books
    @books.each { |book| puts "Book: Title : #{book.title}, Author : #{book.author}" }
  end

  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
  end
end
