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

end