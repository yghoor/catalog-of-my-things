require 'json'

require_relative './item'
require_relative './book'
require_relative './label'

class App
  def initialize
    # rubocop:disable Security/MarshalLoad
    @books =
      if File.size('../config/enviroments/books.json').zero?
        []
      else
        Marshal.load(JSON.parse(File.read('../config/enviroments/books.json')))
      end

    @labels =
      if File.size('../config/enviroments/labels.json').zero?
        []
      else
        Marshal.load(JSON.parse(File.read('../config/enviroments/labels.json')))
      end
    # rubocop:enable Security/MarshalLoad
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

    puts 'Enter a label of the book:'
    title = gets.chomp

    puts 'Enter a color for label:'
    color = gets.chomp

    label = Label.new(title, color)
    @labels << label

    book = Book.new(publisher, cover_state, publish_date, label: label)
    @books << book
  end

  def save_data
    File.write('../config/enviroments/books.json', JSON.generate(Marshal.dump(@books))) unless @books.empty?
    File.write('../config/enviroments/labels.json', JSON.generate(Marshal.dump(@labels))) unless @labels.empty?
  end
end
