require_relative './item'
require_relative './book'
require_relative './label'

class App
  def initialize
    @books = []
    @labels = []
  end

  def display_books
    puts 'List of all books:'
    puts '------------------'
    @books.each { |book| puts "#{book.label.title}, published in #{book.publish_date}" }
  end

  def display_labels
    puts 'List of all labels:'
    puts '-------------------'
    @labels.each { |label| puts "Title: #{label.title}, Color: #{label.color}" }
  end

  def add_book
    puts 'Enter the publisher of the book:'
    publisher = gets.chomp

    puts 'Enter the cover state of the book:'
    cover_state = gets.chomp

    puts 'Enter the publish date of the book [DD/MM/YYYY]:'
    publish_date = gets.chomp

    puts 'Enter the title of the book:'
    title = gets.chomp

    puts 'Enter the color of the book:'
    color = gets.chomp

    label = Label.new(title, color)
    @labels << label

    book = Book.new(publisher, cover_state, publish_date, label: label)
    @books << book
  end
end